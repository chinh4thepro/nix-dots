{ config, pkgs, ... }:
{
  home = {
    file = {
      ".config/wofi/style.css".text = ''
        @import '.config/wofi/colors.css';
        /* ::root{ */
        /*     --accent: #5291e2; */
        /*     --dark: #383C4A; */
        /*     --light: #7C818C; */
        /*     --ld: #404552; */
        /*     --dl: #4B5162 */
        /*     --white: white; */
        /* } */

        *{
          font-family: fantasque sans mono;
          font-size: 20px;
        }

        window {
          background-color: @color2;
        }

        #input {
          margin: 5px;
          border-radius: 0px;
          border: none;
          border-bottom: 3px solid black;
          background-color: @color8;
          color: white;
        }

        #inner-box {
          background-color: @color8;
        }

        #outer-box {
          margin: 5px;
          padding:20px;
          background-color: @color8;
        }

        #scroll {
        }

        #text {
          padding: 5px;
          color: white;
        }

        #entry:selected {
          background-color: @color2;
        }
      '';
      ".config/wofi/colors.css".text = ''
        @define-color foreground #ffffff; 
        @define-color background #0e0e0e;
        @define-color cursor #bf9c9c;

        @define-color color0 #0e0e0e;
        @define-color color1 #CCCCCC;
        @define-color color2 #E8E8E8;
        @define-color color3 #A8A8A8;
        @define-color color4 #f3f3f3;
        @define-color color5 #B8B8B8;
        @define-color color6 #979797;
        @define-color color7 #F5F5F5;
        @define-color color8 #272727;
        @define-color color9 #ffe5e5;
        @define-color color10 #ffe5e5;
        @define-color color11 #f0c4c4;
        @define-color color12 #ffe5e5;
        @define-color color13 #ffd7d7;
        @define-color color14 #d7b0b0;
        @define-color color15 #ffffff;
      '';
      ".config/waybar/colors.css".text = ''
        @define-color foreground #ffffff; 
        @define-color background #0e0e0e;
        @define-color cursor #bf9c9c;

        @define-color color0 #0e0e0e;
        @define-color color1 #CCCCCC;
        @define-color color2 #E8E8E8;
        @define-color color3 #A8A8A8;
        @define-color color4 #f3f3f3;
        @define-color color5 #B8B8B8;
        @define-color color6 #979797;
        @define-color color7 #F5F5F5;
        @define-color color8 #272727;
        @define-color color9 #ffe5e5;
        @define-color color10 #ffe5e5;
        @define-color color11 #f0c4c4;
        @define-color color12 #ffe5e5;
        @define-color color13 #ffd7d7;
        @define-color color14 #d7b0b0;
        @define-color color15 #ffffff;
      '';
      ".config/waybar/style.css".text = ''
        @import 'colors.css' ;
        * {
          font-family: FontAwesome, Fantasque Sans Mono;
          font-size: 14px;
        }

        window#waybar {
          background-color: @color8;
          color: @color15;
          transition-property: background-color;
          transition-duration: .5s; 
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #tray,
        #mode,
        #window,
        #workspaces,
        #workspaces button
        {
           margin: 3px 0;
            color: @color15;
        }

        #clock,
        #window,
        #workspaces button,
        #battery,
        #cpu,
        #memory,
        #disk,
        #backlight,
        #network,
        #pulseaudio,
        #temperature,
        #tray
        {
          color: @color15;
        }
      '';
      ".config/waybar/config".text = ''
        {
            "height": 50,
            "spacing": 5,
            "modules-left": ["custom/space", "tray", "custom/sep", "wlr/workspaces"],
            "modules-center": ["clock"],
            "modules-right": ["pulseaudio", "custom/sep", "network", "custom/sep", "cpu", "custom/sep", "memory", "custom/sep", "temperature", "custom/sep", "backlight", "custom/sep", "battery", "custom/space"], 
            "tray": {
                "spacing": 10
            },
            "clock": {
                "format": "{:%m-%d-%Y %I:%M %p}"
            },
            "cpu": {
                "format": "{usage}% ",
                "tooltip": false
            },
            "memory": {
                "format": "{}% "
            },
            "temperature": {
	        "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
                "critical-threshold": 80,
                "format": "{temperatureC}°C {icon}",
                "format-icons": ["", "", ""]
            },
            "backlight": {
                "format": "{percent}% ☀",
            },
            "battery": {
                "format": "{capacity}% {icon}",
                "format-charging": "{capacity}% {icon}",
                "format-plugged": "{capacity}% ",
                "format-icons": ["", "", "", "", ""]
            },
            "network": {
                "format-wifi": "{essid} ({signalStrength}%) ",
                "format-disconnected": "Disconnected ⚠",
            },
            "pulseaudio": {
                "format": "{icon} {volume}% {format_source}",
                "format-bluetooth": "{volume}% {icon} {format_source}",
                "format-bluetooth-muted": " {icon} {format_source}",
                "format-muted": " {format_source}",
                "format-source": " {volume}%",
                "format-source-muted": "",
                "format-icons": {
                    "headphone": "",
                    "hands-free": "",
                    "headset": "",
                    "default": ["", "", "", ""]
            },
            "wlr/workspaces": {
                "format": "{icon}",
                "on-click": "activate",
                "format-icons": {
                    "1": "",
                    "2": "",
                    "3": "",
                    "4": "",
                    "5": "",
                    "urgent": "",
                    "active": "",
                    "default": ""
              },
              "sort-by-number": true
              },
            },
            "custom/sep": {
    	        "format": " | ",
	        "tooltip": false,
            },
            "custom/space": {
    	        "format": "  ",
	        "tooltip": false,
            },
        }

      '';
      ".config/hypr/hyprland.conf".text = ''
        monitor=,preferred,auto,1

        exec-once = dbus-update-activation-environment --systemd DISPLAY
        exec-once = brightnessctl set 10%
        exec-once = eval $(gnome-keyring-daemon --start --components=ssh)
        exec-once = eval $(ssh-agent)
        exec-once = nm-applet --indicator
        exec-once = waybar & swww init && swww img /home/$USER/Pictures/wallpapers/afar.jpg
        exec-once = fcitx5

        env = XCURSOR_SIZE,24
        env = NIXOS_OZONE_WL,1
        env = __GL_GSYNC_ALLOWED,0
        env = __GL_VRR_ALLOWED,0
        env = DISABLE_QT5_COMPAT,0
        env = GDK_BACKEND,wayland
        env = ANKI_WAYLAND,1
        env = QT_AUTO_SCREEN_SCALE_FACTOR,1
        env = QT_QPA_PLATFORM,wayland
        env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
        env = MOZ_ENABLE_WAYLAND,1
        env = WLR_BACKEND,vulkan
        env = WLR_RENDERER,vulkan
        env = WLR_NO_HARDWARE_CURSORS,1
        env = XDG_SESSION_TYPE,wayland
        env = SDL_VIDEODRIVER,wayland
        env = CLUTTER_BACKEND,wayland
        env = WLR_DRM_DEVICES,/dev/dri/card0
        env = GTK_IM_MODULE,fcitx
        env = XMODIFIERS,@im=fcitx
        env = QT_IM_MODULE,fcitx

        input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          touchpad {
            natural_scroll = no
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        }

        general {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

          gaps_in = 5
          gaps_out = 20
          border_size = 2

          layout = dwindle
        }

        decoration {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

          rounding = 5
          blur = yes
          blur_size = 3
          blur_passes = 1
          blur_new_optimizations = on

          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
        }

        animations {
          enabled = yes

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
        }

        dwindle {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
        }

        master {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true
        }

        gestures {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = off
        }

        # Example windowrule v1
        # windowrule = float, ^(kitty)$
        # Example windowrule v2
        # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


        # See https://wiki.hyprland.org/Configuring/Keywords/ for more
        $mainMod = ALT

        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = $mainMod, Return, exec, foot
        bind = $mainMod_SHIFT, Q, killactive, 
        bind = $mainMod_SHIFT, E, exit, 
        bind = $mainMod_SHIFT, V, togglefloating,
        bind = $mainMod, F, fullscreen
        bind = $mainMod, D, exec, wofi --show drun
        bind = $mainMod SHIFT, S, exec, grim -g "$(slurp)" - | wl-copy

        # Move focus with mainMod + arrow keys
        bind = $mainMod, left, movefocus, l
        bind = $mainMod, right, movefocus, r
        bind = $mainMod, up, movefocus, u
        bind = $mainMod, down, movefocus, d

        # Switch workspaces with mainMod + [0-9]
        bind = $mainMod, 1, workspace, 1
        bind = $mainMod, 2, workspace, 2
        bind = $mainMod, 3, workspace, 3
        bind = $mainMod, 4, workspace, 4
        bind = $mainMod, 5, workspace, 5
        bind = $mainMod, 6, workspace, 6
        bind = $mainMod, 7, workspace, 7
        bind = $mainMod, 8, workspace, 8
        bind = $mainMod, 9, workspace, 9
        bind = $mainMod, 0, workspace, 10

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        bind = $mainMod SHIFT, 1, movetoworkspace, 1
        bind = $mainMod SHIFT, 2, movetoworkspace, 2
        bind = $mainMod SHIFT, 3, movetoworkspace, 3
        bind = $mainMod SHIFT, 4, movetoworkspace, 4
        bind = $mainMod SHIFT, 5, movetoworkspace, 5
        bind = $mainMod SHIFT, 6, movetoworkspace, 6
        bind = $mainMod SHIFT, 7, movetoworkspace, 7
        bind = $mainMod SHIFT, 8, movetoworkspace, 8
        bind = $mainMod SHIFT, 9, movetoworkspace, 9
        bind = $mainMod SHIFT, 0, movetoworkspace, 10

        # Brightness and volume
        bind = ,XF86MonBrightnessUp, exec, brightnessctl set 2%+
        bind = ,XF86MonBrightnessDown, exec, brightnessctl set 2%-
        bind = ,XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +2%
        bind = ,XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -2%
        bind = ,XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
        bind = ,XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle

        # Powerbutton
        bind = ,XF86PowerOff, exec, powermenu

        # Scroll through existing workspaces with mainMod + scroll
        bind = $mainMod, mouse_down, workspace, e+1
        bind = $mainMod, mouse_up, workspace, e-1

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow
      '';
    };
  };
}
