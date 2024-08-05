{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    alejandra
    just
    wget
    home-manager
  ];
}
