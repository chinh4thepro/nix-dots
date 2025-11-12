{...}: {
  imports = [
    ../apps.nix
    ../default.nix
    ../hyprland.nix
  ];

  home = {
    enableNixpkgsReleaseCheck = false;
    homeDirectory = "/home/chinh4thepro";
    stateVersion = "25.11";
    username = "chinh4thepro";
  };

  programs.home-manager.enable = true;
}
