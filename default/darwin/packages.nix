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
    neovim
    wget
    home-manager
  ];
}

