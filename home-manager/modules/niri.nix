{
  config,
  pkgs,
  niri,
  ...
}: {
  programs = {
    niri = {
      settings = {
        # Environment
        environment = {
          "NIXOS_OZONE_WL" = 1;
        };

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
