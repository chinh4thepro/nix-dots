{
  lib,
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

      # Coding
      gcc
      vscode
      zed-editor

      # Files
      p7zip

      # Internet
      yt-dlp
      wget
      curl
      rsync
      vesktop

      # Terminal Multiplexer
      tmux

      # Nix Tools
      alejandra
      nixd
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
