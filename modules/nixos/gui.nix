{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    gnome-themes-extra
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6
    pavucontrol
  ];

  security.rtkit.enable = true;

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    logind = {
      extraConfig = ''
        HandlePowerKey=ignore
      '';
    };
    upower.enable = true;
  };
}
