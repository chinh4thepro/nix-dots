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
  ];

  system.stateVersion = 4;
}
