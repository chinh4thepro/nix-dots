{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ./git.nix
    ./stylix.nix
    ./zsh.nix
  ];

  home = {
    username = "chinh4thepro";
    homeDirectory = "/home/chinh4thepro";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
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

      # Coding
      gcc
      rustup

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
    ]
    ++ lib.optionals stdenv.isDarwin [
      coreutils
      wifi-password
      time
      neofetch
      stats
    ]
    ++ lib.optionals stdenv.isLinux [
      protonvpn-gui
    ];

  programs = {
    bat.enable = true;
    git.enable = true;
    home-manager.enable = true;
  };
}
