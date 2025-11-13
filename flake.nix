{
  description = "chinh's nixos config";

  inputs = {
    # An anime game launcher
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Jerry
    jerry = {
      url = "github:justchokingaround/jerry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Lanzaboote
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # MangoWC
    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix-Gaming
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hardware quirks
    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # NixVim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Quickshell
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-qml-support = {
      url = "github:outfoxxed/nix-qml-support";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Spicetify
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    aagl,
    home-manager,
    lanzaboote,
    mangowc,
    nixos-hardware,
    nixpkgs,
    nixvim,
    nix-qml-support,
    spicetify-nix,
    stylix,
    quickshell,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    mkNixos = modules:
      nixpkgs.lib.nixosSystem {
        modules =
          modules
          ++ [
            home-manager.nixosModules.home-manager
            aagl.nixosModules.default
            stylix.nixosModules.stylix
            lanzaboote.nixosModules.lanzaboote
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {inherit inputs outputs spicetify-nix;};
                backupFileExtension = "bak";
              };
            }
          ];
        specialArgs = {inherit inputs outputs;};
      };

    mkDarwin = system: modules:
      inputs.darwin.lib.darwinSystem {
        inherit modules system inputs;
        specialArgs = {inherit inputs outputs;};
      };

    mkHome = modules: pkgs:
      home-manager.lib.homeManagerConfiguration {
        inherit modules pkgs;
        extraSpecialArgs = {inherit inputs outputs;};
      };
  in {
    nixpkgs = {
      config = {
        allowUnfree = true;
      };
    };

    nixosConfigurations = {
      # Framework 13
      aurora = mkNixos [
        ./hosts/aurora
        nixos-hardware.nixosModules.framework-13-7040-amd
        {
          home-manager.users.chinh4thepro = ./modules/home/config/laptop.nix;
        }
      ];
    };

    darwinConfigurations = {
    };

    homeConfigurations = {
    };
  };
}
