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
      hyperfine
      ffmpeg-full

      # Codding
      rustup
      neovim
      tree-sitter
      tree-sitter-grammars.tree-sitter-cpp
      ## Wher zed :(

      # Shell
      any-nix-shell

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
      inputs.jerry.packages."x86_64-darwin".jerry
    ]
    ++ lib.optionals stdenv.isLinux [
      protonvpn-gui
      inputs.jerry.packages."x86_64-linux".jerry
    ];

  programs = {
    git.enable = true;
    bat.enable = true;
  };
}
