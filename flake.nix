{
  description = "chinh's nixos config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hardware quirks
    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    # Darwin/MacOS
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Jerry
    jerry = {
      url = "github:justchokingaround/jerry";
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

    # Hyprland
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    # An anime game launcher
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Aylurs gtk shell
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix-Gaming
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Zen Browser
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Lanzaboote
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixVim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    spicetify-nix,
    stylix,
    aagl,
    lanzaboote,
    nixvim,
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
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {inherit inputs outputs spicetify-nix;};
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
    nixosConfigurations = {
      # Macbook Pro A1708
      A1708 = mkNixos [
        nixos-hardware.nixosModules.apple-macbook-pro-14-1
        ./hosts/A1708
        {
          home-manager.users.chinh4thepro = ./home-manager/machines/A1708.nix;
        }
      ];
      # Lenovo Ideapad 15alc6
      lappy = mkNixos [
        ./hosts/lappy
        {
          home-manager.users.chinh4thepro = ./home-manager/machines/lappy.nix;
        }
      ];
      # Desktop
      berry = mkNixos [
        ./hosts/berry
        {
          home-manager.users.chinh4thepro = ./home-manager/machines/berry.nix;
        }
      ];
    };

    darwinConfigurations = {
      # Macbook Pro A1708 (but macos)
      aerial = mkDarwin "x86_64-darwin" [
        {
          home-manager.users.chinh4thepro = ./home-manager/machines/aerial.nix;
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit inputs outputs spicetify-nix;};
        }
        home-manager.darwinModules.home-manager
        stylix.darwinModules.stylix
        ./hosts/aerial
      ];

      # Desktop
      aqua = mkDarwin "x86_64-darwin" [
        {
          home-manager.users.chinh4thepro = ./home-manager/machines/aqua.nix;
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit inputs outputs spicetify-nix;};
        }
        home-manager.darwinModules.home-manager
        stylix.darwinModules.stylix
        ./hosts/aqua
      ];
    };

    homeConfigurations = {
      "chinh4thepro@aerial" = mkHome [./home-manager/machines/aerial.nix] nixpkgs.legacyPackages.x86_64-darwin;
      "chinh4thepro@aqua" = mkHome [./home-manager/machines/aqua.nix] nixpkgs.legacyPackages.x86_64-darwin;
    };
  };
}
