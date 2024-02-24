{ config, pkgs, ... }:

{
  imports = [
    ../modules/default.nix 
  ];

  home = {
    username = "chinh4thepro";
    homeDirectory = "/home/chinh4thepro";
    stateVersion = "23.11";
    enableNixpkgsReleaseCheck = false;
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };
}
