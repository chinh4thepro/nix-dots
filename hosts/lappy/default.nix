{ pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../default/gui/hyprland.nix
    ../../default/nixos
    ../../default/style
    ../../default/games
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
    hostName = "lappy";
    networkmanager.enable = true;
  };

  # Services
  services = {
    openssh.enable = true;
  };

  # Nix options
  nix = {
    distributedBuilds = true;
  };

  # Stylix image
  stylix = {
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/chinh4thepro/walls/main/daydream/daydream.png";
      sha256 = "90a6f922d8998dfdab13649512f53724c4bb95a4cdf4956932a43aa4cb9f4f71";
    };
  };

  system.stateVersion = "24.05";
}
