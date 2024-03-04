{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs = {
    bat = {
      enable = true;
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
      hyperfine

      # Files
      p7zip
    
      # Internet
      yt-dlp
      gping
      wget
      curl
      rsync

      # Media
      ani-cli
      mpv

      # Terminal Multiplexer
      zellij

      # Nix Tools
      alejandra
    ]
    ++ lib.optionals stdenv.isDarwin [
      coreutils
      wifi-password
      time
    ];

  programs = {
    git.enable = true;
  };
}
