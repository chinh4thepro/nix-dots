{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../default/debug
    ../../default/games
    ../../default/gui/hyprland.nix
    ../../default/nixos
    ../../default/nixos/fprintd.nix
    ../../default/style
  ];

  # Boot
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
      timeout = 0;
    };
    plymouth = {
      enable = true;
    };
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };

  # Networking
  networking = {
    hostName = "aurora";
  };

  # Services
  services = {
    fstrim.enable = true;
    openssh.enable = true;
    fwupd.enable = true;
  };

  # Nix options
  nix = {
    distributedBuilds = true;
  };

  # Stylix image
  stylix = {
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/chinh4thepro/walls/refs/heads/main/jellyfish/jellyfish.jpg";
      sha256 = "iYGzGjPbEpxTsb8LTN9ZVkdkW/ix+1IqoR5KH3AINaE=";
    };
  };

  system.stateVersion = "25.05";
}
