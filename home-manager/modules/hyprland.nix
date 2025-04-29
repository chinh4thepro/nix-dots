{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    #plugins = [
    #  split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    #];
    settings = {
      monitor = ",preferred,auto,1";

      # plugin = {
      #   split-monitor-workspaces = {
      #     count = 10;
      #     keep_focused = 0;
      #     enable_notifications = 0;
      #   };
      # };

      exec-once = [
        "hyprpaper"
        "brightnessctl set 50%"
        "ags run"
        "fcitx5 -d -r"
        "fcitx5-remote -r"
      ];

      general = {
        gaps_in = "15";
        gaps_out = "20";
        border_size = "10";
      };

      decoration = {
        rounding = "0";
        blur = {
          enabled = "true";
          size = "4";
          passes = "3";
        };
      };

      blurls = "waybar";

      gestures = {
        workspace_swipe = "true";
      };

      windowrule = [
        "pseudo, fcitx"
      ];

      "$mod" = "SUPER";

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bind =
        [
          "$mod SHIFT, Q, killactive"
          "$mod SHIFT, E, exit,"
          "$mod SHIFT, V, togglefloating,"
          "$mod SHIFT, S, exec, grimblast --cursor --freeze copy area"
          "$mod, F, fullscreen"
          "$mod, RETURN, exec, kitty"
          "$mod, D, exec, wofi --show drun"
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightnessctl s 2%+"
          ",XF86MonBrightnessDown, exec, brightnessctl s 2%-"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
    };
  };

  home.packages = with pkgs; [
    wofi
  ];
}
