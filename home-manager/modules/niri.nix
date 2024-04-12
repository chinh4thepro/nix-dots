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
        outputs."eDP-1".scale=1.50;

        # Keybinds
        binds = {
          "Mod+Shift+Slash".action.show-hotkey-overlay = 1;
          "Mod+Shift+E".action.quit = 1;
          "Mod+Return".action.spawn = ["Kitty"];
          "Mod+D".action.spawn = ["wofi" "--show" "drun"];
        };
      };
    };
  };

  home.packages = with pkgs; [
    wofi
  ];
}
