{pkgs, ...}: {
  services = {
    printing.enable = true;
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

  security.rtkit.enable = true;

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

  programs = {
    firefox = {
      enable = true;
      preferences = {
        "browser.fullscreen.autoHide" = false;
        "browser.aboutConfig.showWarning" = false;
        "trailhead.firstrun.didSeeAboutWelcome" = true;
      };
    };
  };
}
