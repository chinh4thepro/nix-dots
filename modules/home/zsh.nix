{lib,pkgs,...}: let
  inherit (lib.attrsets) optionalAttrs;
  inherit (pkgs.stdenv) isLinux isDarwin;
in {
  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";

    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "gentoo";
      plugins = [
        "git"
      ];
    };

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 20000;
      size = 20000;
      share = true;
    };

    shellAliases =
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
        format = "${pkgs.alejandra}/bin/alejandra";
      }
      // optionalAttrs isLinux {
        rebuild = "sudo nixos-rebuild switch --flake .";
      }
      // optionalAttrs isDarwin {
        rebuild = "darwin-rebuild switch --flake .";
      };
  };
}
