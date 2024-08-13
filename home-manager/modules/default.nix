{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./zsh
    ./fonts.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home.packages = with pkgs;
    [
      # CLI Tools
      eza
      zoxide
      btop
      fd
      fzf
      ripgrep
      killall
      fastfetch
      tree
      ffmpeg-full
      unrar
      pipx
      direnv

      # Coding
      rustup
      tree-sitter
      tree-sitter-grammars.tree-sitter-cpp
      gcc
      vscodium
      zed-editor

      # Shell
      any-nix-shell

      # Extra theming
      pywal16

      # Files
      p7zip

      # Internet
      yt-dlp
      gping
      wget
      curl
      rsync
      vesktop

      # Terminal Multiplexer
      tmux

      # Nix Tools
      alejandra
    ]
    ++ lib.optionals stdenv.isDarwin [
      coreutils
      wifi-password
      time
      raycast
      neofetch
      stats
    ]
    ++ lib.optionals stdenv.isLinux [
      protonvpn-gui
    ];

  programs = {
    git.enable = true;
    bat.enable = true;
  };
}
