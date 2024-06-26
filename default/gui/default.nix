{pkgs, ...}: {
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    gnome.gnome-themes-extra
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6
    mkvtoolnix
  ];
}
