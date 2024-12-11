{...}: {
  imports = [
    ../modules/default.nix
    ../modules/apps
    ../modules/mac/stylix.nix
  ];

  home = {
    username = "chinh4thepro";
    homeDirectory = "/Users/chinh4thepro";
    stateVersion = "25.05";
    enableNixpkgsReleaseCheck = true;
  };

  programs.home-manager.enable = true;
}
