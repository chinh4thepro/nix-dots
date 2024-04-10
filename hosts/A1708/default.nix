{ pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../default/nixos
  ];

  # Boot
  boot.loader = {
    systemd-boot.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
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

  system.stateVersion = "24.05";
}
