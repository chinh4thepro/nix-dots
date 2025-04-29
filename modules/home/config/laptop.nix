{...}: {
  imports = [
    ../apps.nix
    ../default.nix
    ../hyprland.nix
  ];

  home = {
    enableNixpkgsReleaseCheck = false;
    homeDirectory = "/home/chinh4thepro";
    stateVersion = "25.05";
    username = "chinh4thepro";
  };

  programs.home-manager.enable = true;
}
