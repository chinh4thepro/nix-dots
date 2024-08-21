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
      git-remote = "git remote set-url origin ssh://git@github.com:/$(whoami)/$(basename $(pwd))";
      gpl = "git pull";
      gpu = "git push";
      gcl = "git clone";
      gc = "git commit";
      gaa = "git add -A";
      szsh = "source ~/.zshrc";
      benchmark = "${pkgs.hyperfine}/bin/hyperfine --warmup 3 ";
    }
    // optionalAttrs isLinux {
      rebuild = "sudo nixos-rebuild switch --flake .";
      rebuild-update = "sudo nixos-rebuild switch --recreate-lock-file --flake .";
      scrot = "${pkgs.grim}/bin/grim \"desktop-$(date +\"%Y%m%d%H%M\").png\"";
      xclip = "tee >(${pkgs.wl-clipboard}/bin/wl-copy) | ${pkgs.wl-clipboard}/bin/wl-copy -p";
    }
    // optionalAttrs isDarwin {
      rebuild = "darwin-rebuild switch --flake .";
      rebuild-update = "darwin-rebuild switch --recreate-lock-file --flake .";
      xclip = "pbcopy";
      ding = "osascript -e 'display notification \"command done\"'";
    };
}
