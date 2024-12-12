{
  pkgs,
  config,
  inputs,
  outputs,
  ...
}: let
  inherit (inputs) nixpkgs;
in {
  imports = [
    ./homebrew.nix
    ./packages.nix
    ./yabai.nix
  ];

  security.pam.enableSudoTouchIdAuth = true;

  environment.systemPackages = with pkgs; [
    neovim
    home-manager
    kitty
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  users.users.chinh4thepro = {
    name = "chinh4thepro";
    home = "/Users/chinh4thepro";
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  services.nix-daemon.enable = true;

  nix = {
    settings = {
      builders-use-substitutes = true;
    };
    optimise = {
      automatic = true;
    };
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 6d";
    };
    extraOptions = ''
      # Determinate systems options
      build-users-group = nixbld
      bash-prompt-prefix = (nix:$name)\040
      max-jobs = auto
      extra-nix-path = nixpkgs=flake:nixpkgs
      experimental-features = nix-command flakes
    '';
    registry.nixpkgs.flake = nixpkgs;
  };

  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
    defaults = {
      loginwindow.GuestEnabled = false;
      spaces.spans-displays = false;
      screencapture.location = "~/Pictures/screenshots";
      dock = {
        autohide = true;
        showhidden = true;
        mru-spaces = false;
        persistent-apps = [
          "/System/Applications/Launchpad.app"
          "/Applications/Zen Browser.app"
          "${config.users.users.chinh4thepro.home}/Applications/Home Manager Apps/kitty.app"
          "${config.users.users.chinh4thepro.home}/Applications/Home Manager Apps/Spotify.app"
          "${config.users.users.chinh4thepro.home}/Applications/Home Manager Apps/Vesktop.app"
          "${config.users.users.chinh4thepro.home}/Applications/Home Manager Apps/Zed.app"
          "/System/Applications/System Settings.app"
        ];
      };
      finder = {
        AppleShowAllExtensions = true;
      };
      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        ApplePressAndHoldEnabled = false;
        NSWindowShouldDragOnGesture = true;
      };
    };
  };

  nixpkgs.config.allowUnfree = true;
}
