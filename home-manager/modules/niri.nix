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
          NIXOS_OZONE_WL = "1";
        };

        # Display
        outputs."eDP-1".scale = 2.0;

        # Keybinds
        binds = with config.lib.niri.actions; {
          "Mod+Shift+Slash".action = show-hotkey-overlay;
          "Mod+Shift+E".action = quit;
          "Mod+Shift+Q".action = close-window;
          "Mod+Return".action = spawn "kitty";
          "Mod+D".action = spawn "wofi" "--show" "drun";
        };
      };
    };
  };

  home.packages = with pkgs; [
    wofi
  ];
}
