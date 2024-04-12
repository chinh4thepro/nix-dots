{
  config,
  pkgs,
  niri,
  ...
}: {
  programs = {
    niri = {
      settings = {
        # Gap
        gap = 10;

        # Environment
        environment = {
          NIXOS_OZONE_WL = "1";
        };

        # Display
        outputs."eDP-1".scale = 2.0;

        # Keybinds
        binds = with config.lib.niri.actions; {
          # Key
          "Mod+Shift+Slash".action = show-hotkey-overlay;

          # Basic binds
          "Mod+Shift+E".action = quit;
          "Mod+Shift+Q".action = close-window;
          "Mod+F".action = fullscreen-window;

          # Launch program
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
