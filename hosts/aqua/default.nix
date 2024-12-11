{
  pkgs,
  lib,
  inputs,
  ...
}: let
  inherit (inputs) nixpkgs;
in {
  imports = [
    ../../default/darwin
    ../../default/darwin/style.nix
  ];

  # Stylix image
  stylix = {
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/chinh4thepro/walls/refs/heads/main/trains/trains.jpg";
      sha256 = "enWwjqTu61w1goWRwpze8De4zpxnJfoIcqK5XjG5BEo=";
    };
  };

  networking.hostName = "aqua";
  system.stateVersion = 4;
}
