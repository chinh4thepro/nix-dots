{pkgs, ...}: {
  imports = [
    ../modules/apps
    ../modules/ags.nix
    ../modules/default.nix
    ../modules/hyprland.nix
    ../modules/stylix.nix
  ];

  home = {
    username = "chinh4thepro";
    homeDirectory = "/home/chinh4thepro";
    stateVersion = "25.05";
    enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager.enable = true;
}
