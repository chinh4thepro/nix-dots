{ config, pkgs, ... }:

{
  imports = [
    ./config-files.nix
  ];

  home = {

    username = "chinh4thepro";
    homeDirectory = "/home/chinh4thepro";
    stateVersion = "22.11";
    
    packages = with pkgs; [

      # Wayland
      libnotify
      libsixel
      wofi
      seatd
      brightnessctl
      pamixer
      slurp
      grim
      wl-clipboard
      swayidle

      # Audio
      pavucontrol
      pulsemixer

      # Cli tools
      unzip
      zip
      imagemagick
      tmux
      ffmpeg_6-full
      dconf
      sutils

      # Theming
      bibata-cursors

      # Media
      ani-cli

    ];

    sessionVariables = {
      EDITOR = "nvim";
    };

    pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
      gtk.enable = true;
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };
    neovim = {
      enable = true;
      vimAlias = true;
      plugins = [
        pkgs.vimPlugins.vim-nix
      ];
    };
    zsh = {
      enable = true;
      enableSyntaxHighlighting = true;
      oh-my-zsh = {
        enable = true;
        theme = "gentoo";
      };
      shellAliases = {
        mkdir = "mkdir -p";
      };
      envExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec Hyprland
        fi
      '';
    };
    nushell = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "chinh4thepro";
      userEmail = "chinh4thepro@gmail.com";
    };
  };

  xdg = {
    mimeApps = {
      enable = true;
      associations.added = {
        "text/html" = ["librewolf.desktop"];
        "x-scheme-handler/http" = ["librewolf.desktop"];
        "x-scheme-handler/https" = ["librewolf.desktop"];
        "x-scheme-handler/ftp" = ["librewolf.desktop"];
        "x-scheme-handler/about" = ["librewolf.desktop"];
        "x-scheme-handler/unknown" = ["librewolf.desktop"];
        "application/x-extension-htm" = ["librewolf.desktop"];
        "application/x-extension-html" = ["librewolf.desktop"];
        "application/x-extension-shtml" = ["librewolf.desktop"];
        "application/xhtml+xml" = ["librewolf.desktop"];
        "application/x-extension-xhtml" = ["librewolf.desktop"];
        "application/x-extension-xht" = ["librewolf.desktop"];
        "audio/*" = ["mpv.desktop"];
        "video/*" = ["mpv.dekstop"];
        "image/*" = ["imv.desktop"];
        "application/json" = ["librewolf.desktop"];
        "application/pdf" = ["sioyek.desktop"];
        "application/epub+zip" = ["sioyek.desktop"];
        "application/zip" = ["sioyek.desktop"];
      };
      defaultApplications = {
        "text/html" = ["librewolf.desktop"];
        "x-scheme-handler/http" = ["librewolf.desktop"];
        "x-scheme-handler/https" = ["librewolf.desktop"];
        "x-scheme-handler/ftp" = ["librewolf.desktop"];
        "x-scheme-handler/about" = ["librewolf.desktop"];
        "x-scheme-handler/unknown" = ["librewolf.desktop"];
        "application/x-extension-htm" = ["librewolf.desktop"];
        "application/x-extension-html" = ["librewolf.desktop"];
        "application/x-extension-shtml" = ["librewolf.desktop"];
        "application/xhtml+xml" = ["librewolf.desktop"];
        "application/x-extension-xhtml" = ["librewolf.desktop"];
        "application/x-extension-xht" = ["librewolf.desktop"];
        "audio/*" = ["mpv.desktop"];
        "video/*" = ["mpv.dekstop"];
        "image/*" = ["imv.desktop"];
        "application/json" = ["librewolf.desktop"]; 
        "application/pdf" = ["sioyek.desktop"];
        "application/epub+zip" = ["sioyek.desktop"];
        "application/zip" = ["sioyek.desktop"];
      };
    };
  };
}
