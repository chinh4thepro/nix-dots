{
  config,
  pkgs,
  niri,
  ...
}: {
  programs = {
    niri = {
      environment = {
        "NIXOS_OZONE_WL" = 1;
      };
      settings = {
        # Display
        outputs."eDP-1".scale=1.50;

        # Keybinds
        binds = {
          "Mod+Return".action.spawn = ["Kitty"];
        };
      };
    };
  };
}
