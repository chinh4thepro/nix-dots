{
  pkgs,
  lib,
  inputs,
  ...
}: let
  inherit (inputs) nixpkgs;
in {
  imports = [
    ../../default/nixos
  ];

  system.stateVersion = 4;
}

