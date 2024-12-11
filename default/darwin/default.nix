{
  pkgs,
  inputs,
  outputs,
  ...
}: let
  inherit (inputs) nixpkgs;
in {
  imports = [
    ./packages.nix
    ./yabai.nix
  ];

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
      chime = false;
      loginwindow.GuestEnabled = false;
      spaces.spans-displays = false;
      dock = {
        autohide = true;
        showhidden = true;
        persistent-apps = [
          "/System/Applications/Launchpad.app"
          "/Applications/Zen Browser.app"
          "/Applications/Home Manager Apps/Kitty.app"
          "/Applications/Home Manager Apps/Vesktop.app"
          "${pkgs.zed-editor}/bin/Zed.app"
          "/System/Applications/System Settings.app"
        ];
      };
      finder = {
        AppleShowAllExtensions = true;
      };
      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        ApplePressAndHoldEnabled = false;
      };
    };
  };

  nixpkgs.config.allowUnfree = true;
}
