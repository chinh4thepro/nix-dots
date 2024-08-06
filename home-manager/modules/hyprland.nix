{
  config,
  pkgs,
  split-monitor-workspaces,
  ...
}: {
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
      ];
     
      general = {
        gaps_in = "5";
	      gaps_out = "10";
	      border_size = "2";
      };

      decoration = {
        rounding = "0";
	      blur = {
	        enabled = "true";
	        size = "3";
	        passes = "3";
	      };
      };

      blurls = "waybar";

      gestures = {
        workspace_swipe = "true";
      };
      
      "$mod" = "SUPER";
      bindm = [
        "$mod, mouse:272, movewindow"
	      "$mod, mouse:273, resizewindow"
      ];
      bind = [
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
	      ",XF86MonBrightnessUp, exec, brightnessctl set 2%+"
	      ",XF86MonBrightnessDown, exec, brightnessctl set 2%-"
	      ",XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +2%"
	      ",XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -2%"
	      ",XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
	      ",XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
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

  imports = [
    ./waybar.nix
  ];
}
