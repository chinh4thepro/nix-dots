{ config, pkgs, ... }:

{
  imports = [
    ../modules/default.nix
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
