{...}: {
  imports = [
    ./packages.nix
    ./users.nix
    ./locale.nix
    ./network.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      trusted-users = [
        "root"
        "chinh4thepro"
        "@wheel"
      ];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 6d";
    };
    optimise = {
      automatic = true;
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "25.05";
}
