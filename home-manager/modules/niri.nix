{
  config,
  pkgs,
  niri,
  ...
}: {
  programs = {
    niri = {
      enable = "true";
      settings = {
        # Environment
        environment = {
          NIXOS_OZONE_WL = "1";
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
