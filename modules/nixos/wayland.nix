{pkgs, ...}: {
  environment.sessionVariables = {
    ANKI_WAYLAND = "1";
    GDK_BACKEND = "wayland";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
    GTK_USE_PORTAL = "1";
    NIXOS_OZONE_WL = "1";
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    XDG_SESSION_TYPE = "wayland";
  };

  environment.systemPackages = with pkgs; [
    wlr-randr
    wl-clipboard
    polkit_gnome
    gnome-calculator
    gnome-clocks
    gnome-calendar
    gnome-weather
    gnome-system-monitor
    loupe
    nautilus
    brightnessctl
    file-roller
    adwaita-icon-theme
    morewaita-icon-theme
  ];

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  services = {
    greetd = {
      enable = true;
      enableGnomeKeyring = true;
    };
  };

  programs = {
    regreet.enable = true;
  };
}
