{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.lists) optionals;
  inherit (lib.attrsets) optionalAttrs;
  inherit (pkgs.stdenv) isLinux isDarwin;
in {
  programs.zsh.shellAliases =
    {
      neovim = "nvim";
      vim = "nvim";
      diff = "${pkgs.colordiff}/bin/colordiff";
      grep = "${pkgs.ripgrep}/bin/rg";
      cat = "${pkgs.bat}/bin/bat -p";
      ls = "${pkgs.eza}/bin/eza --icons always";
      l = "${pkgs.eza}/bin/eza --icons -al";
      mkdir = "mkdir -pv";
      df = "df -h";
      dd = "dd status=progress bs=4M conv=fdatasync ";
      sudo = "sudo env \"PATH=$PATH\" ";
      gre = "git remote set-url origin ssh://git@github.com:/$(whoami)/$(basename $(pwd))";
      gpl = "git pull";
      gpu = "git push";
      gcl = "git clone";
      gco = "git commit";
      gaa = "git add -A";
      szsh = "source ~/.zshrc";
      update = "nix flake update";
    }
    // optionalAttrs isLinux {
      rebuild = "sudo nixos-rebuild switch --flake .";
    }
    // optionalAttrs isDarwin {
      rebuild = "darwin-rebuild switch --flake .";
    };
}
