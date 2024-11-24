{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../default/gui/hyprland.nix
    ../../default/nixos
    ../../default/style
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
  };

  # Services
  services = {
    fstrim.enable = true;
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

  # Stylix image
  stylix = {
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/chinh4thepro/walls/main/daydream/daydream.png";
      sha256 = "90a6f922d8998dfdab13649512f53724c4bb95a4cdf4956932a43aa4cb9f4f71";
    };
  };

  system.stateVersion = "25.05";
}
