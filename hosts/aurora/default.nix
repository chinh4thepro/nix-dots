{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/config/laptop.nix
  ];

  # Networking
  networking = {
    hostName = "aurora";
  };

  # Services
  services = {
    fwupd.enable = true;
  };

  # Stylix image
  stylix = {
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/chinh4thepro/walls/refs/heads/main/may-25/may-25.jpg";
      sha256 = "xzJNmhhXY6bwtPCu6RrClFxbRDkjmUjdHahy2LCVK00=";
    };
  };

  # System
  system.stateVersion = "25.11";
}
