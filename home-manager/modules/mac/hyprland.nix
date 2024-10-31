{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = ",highres,auto,1.333333";

      input = {
        kb_options = "altwin:swap_lalt_lwin";
      };

      xwayland = {
        force_zero_scaling = "true";
      };
    };
  };
}
