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

  programs = {
    niri = {
      enable = true;
      packages = inputs.niri.packages.${pkgs.system}.niri;
    }
  };
}
