{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./media.nix
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
      hyperfine

      # Files
      p7zip
    
      # Internet
      yt-dlp
      gping
      wget
      curl
      rsync

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
    bat.enable = true;
  };
}
