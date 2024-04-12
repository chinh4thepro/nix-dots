{ config, pkgs, ... }:

{
  imports = [
    ../modules/apps
    ../modules/default.nix
    ../modules/niri.nix
  ];

  home = {
    username = "chinh4thepro";
    homeDirectory = "/home/chinh4thepro";
    stateVersion = "24.05";
    enableNixpkgsReleaseCheck = false;
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };
}
