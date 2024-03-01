{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: let
  inherit (inputs) nixpkgs;
in {
  imports = [
    ./packages.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim
    home-manager
    kitty
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
    users.chinh4thepro = import ../../home-manager/machines/A1708-MACOS.nix;
  }

  users.users.chinh4thepro = {
    name = "chinh4thepro";
    home = "/Users/chinh4thepro";
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  services.nix-daemon.enable = true;

  nix = {
    extraOptions =
      ''
        # Determinate systems options
        build-users-group = nixbld
        bash-prompt-prefix = (nix:$name)\040
        max-jobs = auto
        extra-nix-path = nixpkgs=flake:nixpkgs
        experimental-features = nix-command flakes repl-flake
      '';
    registry.nixpkgs.flake = nixpkgs;
  };

  nixpkgs.config.allowUnfree = true;
}
