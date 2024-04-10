{ pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../default/nixos
    ../../default/debug
  ];

  # Boot
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
    };
  };

  # Networking
  networking = {
    hostName = "A1708";
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

  # Hardware
  hardware = {
    facetimehd = {
      enable = true;
    };
  };

  system.stateVersion = "23.11";
}
