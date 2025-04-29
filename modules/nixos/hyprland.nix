{pkgs, ...}: {
  imports = [
  #  ./wayland.nix
    ./gui.nix
  ];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  services = {
    libinput = {
      enable = true;
      touchpad.tapping = true;
      touchpad.naturalScrolling = false;
      touchpad.scrollMethod = "twofinger";
      touchpad.disableWhileTyping = true;
      touchpad.clickMethod = "clickfinger";
    };
    gnome = {
      gnome-keyring.enable = true;
      sushi.enable = true;
    };
    gvfs.enable = true;
    hypridle = {
      enable = true;
    };
  };

  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    hyprlock = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    libva-utils
    grimblast
    gsettings-desktop-schemas
    hyprpaper
    hyprpicker
    udiskie
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
  ];
}
