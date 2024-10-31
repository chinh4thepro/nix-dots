{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./default.nix
    ./dbus.nix
    ./xdg.nix
    ./wayland.nix
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
    gvfs.enable = true;
    gnome = {
      sushi.enable = true;
      gnome-keyring.enable = true;
    };
    hypridle = {
      enable = true;
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    hyprlock = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    libva-utils
    gsettings-desktop-schemas
    udiskie
    hyprpaper
    hyprpicker
    grimblast
    xdg-desktop-portal-hyprland
  ];
}
