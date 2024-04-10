{ pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../default/nixos
  ];

  system.stateVersion = 4;
}
