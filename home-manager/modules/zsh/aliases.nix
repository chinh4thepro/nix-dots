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
      diff = "${pkgs.colordiff}/bin/colordiff";
      grep = "${pkgs.ripgrep}/bin/rg";
      cat = "${pkgs.bat}/bin/bat -p";
      ls = "${pkgs.eza}/bin/eza --icons always";
      l = "${pkgs.eza}/bin/eza --icons -al";
      mkdir = "mkdir -pv";
      df = "df -h";
      dd = "dd status=progress bs=4M conv=fdatasync ";
      sudo = "sudo env \"PATH=$PATH\" ";
      sd = "cd $(find . -type d -print | ${pkgs.fzf}/bin/fzf)";
      grg = "git remote set-url origin ssh://git@github.com:/$(whoami)/$(basename $(pwd))";
      gp = "git pull";
      gpu = "git push";
      gpf = "git push --force";
      szsh = "source ~/.zshrc";
      mine = "sudo chown -R $(whoami):users";
      benchmark = "${pkgs.hyperfine}/bin/hyperfine --warmup 3 ";
    }
    // optionalAttrs isLinux {
      rebuild = "nixos-rebuild switch --flake .";
      scrot = "${pkgs.grim}/bin/grim \"desktop-$(date +\"%Y%m%d%H%M\").png\"";
      xclip = "tee >(${pkgs.wl-clipboard}/bin/wl-copy) | ${pkgs.wl-clipboard}/bin/wl-copy -p";
    }
    // optionalAttrs isDarwin {
      rebuild = "darwin-rebuild switch --flake .";
      xclip = "pbcopy";
      ding = "osascript -e 'display notification \"command done\"'";
    };
}

