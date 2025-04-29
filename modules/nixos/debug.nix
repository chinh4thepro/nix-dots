{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kdePackages.kate
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;
}
