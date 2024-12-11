{...}: {
  services = {
    yabai = {
      enable = true;
      enableScriptingAddition = true;
      config = {
        auto_balance = "on";
        layout = "bsp";
        top_padding = 10;
        bottom_padding = 10;
        left_padding = 10;
        right_padding = 10;
        window_gap = 5;
        mouse_follows_focus = "on";
        focus_follows_mouse = "on";
        mouse_modifier = "fn";
        window_topmost = "off";
        window_shadow = "float";
        window_border = "on";
        window_opacity = "on";
        active_window_opacity = 1.0;
        normal_window_opacity = 0.75;
      };
    };
    skhd = {
      enable = true;
      skhdConfig = ''
        # Windows

        ## Focus
        alt - h : yabai -m --focus west
        alt - j : yabai -m --focus south
        alt - k : yabai -m --focus north
        alt - l : yabai -m --focus east

        ## Fullscreen
        alt - f         : yabai -m window --toggle zoom-fullscreen
        shift + alt - f : yabai -m window --toggle native-fullscreen

        # Float / Unfloat window
        shift + alt - space : \
        yabai -m window --toggle float; \
        yabai -m window --toggle border

        ## Moving windows
        shift + alt - h : yabai -m window --warp west
        shift + alt - j : yabai -m window --warp south
        shift + alt - k : yabai -m window --warp north
        shift + alt - l : yabai -m window --warp east

        # Applications
        alt - return : open -a kitty -n
      '';
    };
  };
}
