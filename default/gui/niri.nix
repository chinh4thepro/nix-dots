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

  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
      excludePackages = [pkgs.xterm];
      libinput = {
        enable = true;
        touchpad.tapping = true;
        touchpad.naturalScrolling = false;
        touchpad.scrollMethod = "twofinger";
        touchpad.disableWhileTyping = true;
        touchpad.clickMethod = "clickfinger";
      };
    };
    gvfs.enable = true;
    gnome = {
      sushi.enable = true;
      gnome-keyring.enable = true;
    };
  };

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs = {
    niri = {
      enable = true;
      # packages = pkgs.niri-unstable;
    };
    waybar = {
      enable = true;
      package = pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      });
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    libva-utils
    gsettings-desktop-schemas
    udiskie
  ];
}
