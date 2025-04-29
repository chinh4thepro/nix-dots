{...}: {
  imports = [
    ./boot.nix
    ./locale.nix
    ./networking.nix
    ./packages.nix
    ./users.nix
  ];

  nix = {
    distributedBuilds = true;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 6d";
    };
    optimise = {
      automatic = true;
    };
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      trusted-users = [
        "root"
        "chinh4thepro"
        "@wheel"
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
