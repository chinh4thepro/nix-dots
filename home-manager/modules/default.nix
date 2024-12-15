{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ./git.nix
    ./tmux.nix
    ./zsh
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
      rustup
      zed-editor

      # Files
      p7zip

      # Internet
      yt-dlp
      wget
      curl
      rsync
      vesktop

      # Nix Tools
      alejandra
      nixd
      nil
    ]
    ++ lib.optionals stdenv.isDarwin [
      coreutils
      wifi-password
      time
      neofetch
      stats
      gnused
    ]
    ++ lib.optionals stdenv.isLinux [
      protonvpn-gui
    ];

  programs = {
    git.enable = true;
    bat.enable = true;
  };
}
