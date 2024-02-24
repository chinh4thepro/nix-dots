{
  description = "chinh's nixos config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      nixpkgs.follows = "nixpkgs";
    };

    # Hardware quirks
    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
      nixpkgs.follows = "nixpkgs";
    };

    # Stylix
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    hardware,
    home-manager,
    stylix,
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
            stylix.nixosModules.stylix
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {inherit inputs outputs;};
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
        ./hosts/A1708
	{home-manager.users.chinh4thepro = ./home-manager/machines/A1708.nix;}
	{nixos-hardware.nixosModules.apple-macbook-pro-14-1;}
      ];
    };

    homeConfigurations = {
    };
  };
}
