{pkgs, ...}: {
  environment.sessionVariables = {
    ANKI_WAYLAND = "1";
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    QT_QPA_PLATFORM = "wayland;xcb";
    # QT_QPA_PLATFORMTHEME = "qt5ct";
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

  security.pam.services.login.enableGnomeKeyring = true;

  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    gnome = {
      gnome-keyring.enable = true;
      sushi.enable = true;
    };
    #greetd = {
    #  enable = true;
    #};
  };

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

  programs = {
    # regreet.enable = true;
    ssh.startAgent = true;
  };
}
