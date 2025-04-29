{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/config/laptop.nix
    ../../modules/nixos/debug.nix
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
      url = "https://raw.githubusercontent.com/chinh4thepro/walls/refs/heads/main/jellyfish/jellyfish.jpg";
      sha256 = "iYGzGjPbEpxTsb8LTN9ZVkdkW/ix+1IqoR5KH3AINaE=";
    };
  };

  # System
  system.stateVersion = "25.05";
}
