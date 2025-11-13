{pkgs, ...}: {
  imports = [
    ./gui.nix
    ./wayland.nix
  ];

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
  };
}
