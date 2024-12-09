{pkgs, ...}: {
  networking = {
    networkmanager.enable = true;
  };

  environment.systemPackages = [pkgs.tailscale];
  services.tailscale.enable = true;
}
