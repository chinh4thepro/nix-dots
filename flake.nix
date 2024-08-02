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

    # Niri
    niri = {
      url = "github:sodiboo/niri-flake";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    # An anime game launcher
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Aylurs gtk shell
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    spicetify-nix,
    niri,
    stylix,
    aagl,
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
            niri.nixosModules.niri
            aagl.nixosModules.default
            stylix.nixosModules.stylix
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
  in rec {
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
    };

    darwinConfigurations = {
      # Macbook Pro A1708 (but macos)
      A1708-MACOS = mkDarwin "x86_64-darwin" [
        {
          home-manager.users.chinh4thepro = ./home-manager/machines/A1708-MACOS.nix;
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit inputs outputs spicetify-nix;};
        }
        home-manager.darwinModules.home-manager
	    ./hosts/A1708-MACOS
      ];
    };

    homeConfigurations = {
      "chinh4thepro@A1708-MACOS" = mkHome [./home-manager/machines/A1708-MACOS.nix] nixpkgs.legacyPackages.x86_64-darwin;
    };
  };
}
