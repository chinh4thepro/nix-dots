{ config, pkgs, ... }:
{
  home = {
    file = {
      ".config/neofetch/config.conf".text = ''
        print_info() {
            info title
            info underline

            info "OS" distro
            info "Host" model
            info "Kernel" kernel
            info "Uptime" uptime
            info "Packages" packages
            info "Shell" shell
            info "Resolution" resolution
            info "DE" de
            info "WM" wm
            info "WM Theme" wm_theme
            info "Theme" theme
            info "Icons" icons
            info "Terminal" term
            info "CPU" cpu
            info "GPU" gpu
            info "Memory" memory
            info "Disk" disk

            # info "GPU Driver" gpu_driver  # Linux/macOS only
            # info "Song" song

            info cols
        }

        # Title
        title_fqdn="off"


        # Kernel
        kernel_shorthand="on"


        # Distro
        distro_shorthand="on"
        os_arch="on"


        # Uptime
        uptime_shorthand="on"

        # Memory
        memory_percent="off"
        memory_unit="mib"

        # Packages
        package_managers="on"

        # Shell
        shell_path="off"
        shell_version="off"

        # CPU

        # Values: 'scaling_cur_freq', 'scaling_min_freq', 'scaling_max_freq', 'bios_limit'.
        speed_type="bios_limit"
        speed_shorthand="on"
        cpu_brand="on"
        cpu_speed="on"
        cpu_cores="logical"

        # Values:  'C', 'F', 'off'
        cpu_temp="off"

        # GPU
        gpu_brand="on"
        gpu_type="all"

        # Resolution
        refresh_rate="off"


        # Gtk Theme / Icons / Font
        gtk_shorthand="on"
        gtk2="on"
        gtk3="on"

        # Desktop Environment
        de_version="on"

        # Disk
        disk_show=('/')
        disk_subtitle="mount"
        disk_percent="on"

        # Song
        music_player="auto"

        # Values:  '%artist%', '%album%', '%title%'
        song_format="%title$ - %album% - %artist%"
        song_shorthand="off"
        mpc_args=()

        # Text Colors
        colors=(distro)
        bold="on"
        underline_enabled="on"
        underline_char="-"

        separator=" -"

        # Color Blocks
        block_range=(0 15)
        color_blocks="on"
        block_width=3
        block_height=1
        col_offset="auto"

        # Progress Bars
        bar_char_elapsed="-"
        bar_char_total="="
        bar_border="on"
        bar_length=15
        bar_color_elapsed="distro"
        bar_color_total="distro"

        memory_display="off"
        battery_display="off"
        disk_display="off"

        # Backend Settings

        # Image backend.
        image_backend="sixel"
        image_source="/home/$USER/Pictures/neofetch-images/yotsuba.png"

        # Ascii Options
        ascii_distro="auto"
        ascii_colors=(distro)
        ascii_bold="on"

        # Image Options
        image_loop="off"

        # Values:   'normal', 'fit', 'fill'
        crop_mode="normal"

        # Values:   'northwest', 'north', 'northeast', 'west', 'center'
        crop_offset="center"

        # Values:  'auto', '00px', '00%', 'none'
        image_size="15%"

        gap=2
      '';
      
      ".config/dunst/dunstrc".text = ''
        [global]
        notification_limit = 5
        corner_radius = 5
        origin = top-right
        offset = 5x5
        frame_color = "#8CAAEE"
        separator_color= frame

        [urgency_low]
        background = "#303446"
        foreground = "#C6D0F5"

        [urgency_normal]
        background = "#303446"
        foreground = "#C6D0F5"

        [urgency_critical]
        background = "#303446"
        foreground = "#C6D0F5"
        frame_color = "#EF9F76"
      '';

      ".config/wofi/style.css".text = ''
        * {
          font-family: FontAwesome, Fantasque Sans Mono;
          font-size: 14px;
        }

        window {
          margin: 5px;
          background-color: #303446;
          border-radius: 5px;
          color: #c6d0f5;
        }

        #inner-box {
          padding: 0px 10px;
        }

        #outer-box {
          border-radius: 5px;
          background-color: #303446;
          border: 2px solid #232634;
        }

        #entry {
          border-radius: 0px; 
        }
          
        #entry:selected {
          color: #303446;
          border: 2px solid #292c3c;
          border-radius: 5px;
          background-color: #8caaee;
        }

        #input {
          margin-top: 10px;
          margin-bottom: 10px;
          margin-right: 10px;
          margin-left: 10px;
          padding: 10px 10px;
          border: 2px solid #292c3c;
          background-color: #414559;
        }

        #scroll {
          border: 2px solid #292c3c;
          background-color: #414559;
          margin-bottom: 10px;
          margin-right: 10px;
          margin-left: 10px;
          border-radius: 5px;
          padding: 20px 10px;
        }

      '';

      ".config/foot/foot.ini".text = ''
        # app-id=foot
        # title=foot
        # locked-title=no

        font=fantasque sans mono:size=10
        # font-bold=<bold variant of regular font>
        # font-italic=<italic variant of regular font>
        # font-bold-italic=<bold+italic variant of regular font>
        # font-size-adjustment=0.5
        # line-height=<font metrics>
        # letter-spacing=0
        # horizontal-letter-offset=0
        # vertical-letter-offset=0
        # underline-offset=<font metrics>
        # underline-thickness=<font underline thickness>
        # box-drawings-uses-font-glyphs=no
        # dpi-aware=auto

        initial-window-mode=windowed
        # pad=0x0                             # optionally append 'center'
        # resize-delay-ms=100

        # bold-text-in-bright=no
        # word-delimiters=,│`|:"'()[]{}<>
        # selection-target=primary
        # workers=<number of logical CPUs>
        # utempter=/usr/lib/utempter/utempter

        [bell]
        urgent=no
        notify=no

        [scrollback]
        # lines=1000
        # multiplier=3.0
        # indicator-position=relative
        # indicator-format=""

        [cursor]
        # style=block
        # color=<inverse foreground/background>
        # blink=no
        # beam-thickness=1.5
        # underline-thickness=<font underline thickness>

        [mouse]
        # hide-when-typing=no
        # alternate-scroll-mode=yes

        [colors]
        alpha=0.50
        foreground=c6d0f5 # Text
        background=303446 # Base
        regular0=51576d   # Surface 1
        regular1=e78284   # red
        regular2=a6d189   # green
        regular3=e5c890   # yellow
        regular4=8caaee   # blue
        regular5=f4b8e4   # pink
        regular6=81c8be   # teal
        regular7=b5bfe2   # Subtext 1
        bright0=626880    # Surface 2
        bright1=e78284    # red
        bright2=a6d189    # green
        bright3=e5c890    # yellow
        bright4=8caaee    # blue
        bright5=f4b8e4    # pink
        bright6=81c8be    # teal
        bright7=a5adce    # Subtext 0

        ## The remaining 256-color palette
        # 16 = <256-color palette #16>
        # ...
        # 255 = <256-color palette #255>

        ## Misc colors
        # selection-foreground=<inverse foreground/background>
        # selection-background=<inverse foreground/background>
        # jump-labels=<regular0> <regular3>          # black-on-yellow
        # scrollback-indicator=<regular0> <bright4>  # black-on-bright-blue
        # search-box-no-match=<regular0> <regular1>  # black-on-red
        # search-box-match=<regular0> <regular3>     # black-on-yellow
        # urls=<regular3>

        [csd]
        # preferred=server
        # size=26
        # font=<primary font>
        # color=<foreground color>
        # hide-when-typing=no
        # border-width=0
        # border-color=<csd.color>
        # button-width=26
        # button-color=<background color>
        # button-minimize-color=<regular4>
        # button-maximize-color=<regular2>
        # button-close-color=<regular1>

        [key-bindings]
        # scrollback-up-page=Shift+Page_Up
        # scrollback-up-half-page=none
        # scrollback-up-line=none
        # scrollback-down-page=Shift+Page_Down
        # scrollback-down-half-page=none
        # scrollback-down-line=none
        # clipboard-copy=Control+Shift+c XF86Copy
        # clipboard-paste=Control+Shift+v XF86Paste
        # primary-paste=Shift+Insert
        # search-start=Control+Shift+r
        # font-increase=Control+plus Control+equal Control+KP_Add
        # font-decrease=Control+minus Control+KP_Subtract
        # font-reset=Control+0 Control+KP_0
        # spawn-terminal=Control+Shift+n
        # minimize=none
        # maximize=none
        # fullscreen=none
        # pipe-visible=[sh -c "xurls | fuzzel | xargs -r firefox"] none
        # pipe-scrollback=[sh -c "xurls | fuzzel | xargs -r firefox"] none
        # pipe-selected=[xargs -r firefox] none
        # show-urls-launch=Control+Shift+u
        # show-urls-copy=none
        # show-urls-persistent=none
        # prompt-prev=Control+Shift+z
        # prompt-next=Control+Shift+x
        # unicode-input=none
        # noop=none

        [search-bindings]
        # cancel=Control+g Control+c Escape
        # commit=Return
        # find-prev=Control+r
        # find-next=Control+s
        # cursor-left=Left Control+b
        # cursor-left-word=Control+Left Mod1+b
        # cursor-right=Right Control+f
        # cursor-right-word=Control+Right Mod1+f
        # cursor-home=Home Control+a
        # cursor-end=End Control+e
        # delete-prev=BackSpace
        # delete-prev-word=Mod1+BackSpace Control+BackSpace
        # delete-next=Delete
        # delete-next-word=Mod1+d Control+Delete
        # extend-to-word-boundary=Control+w
        # extend-to-next-whitespace=Control+Shift+w
        # clipboard-paste=Control+v Control+Shift+v Control+y XF86Paste
        # primary-paste=Shift+Insert
        # unicode-input=none

        [url-bindings]
        # cancel=Control+g Control+c Control+d Escape
        # toggle-url-visible=t

        [text-bindings]
        # \x03=Mod4+c  # Map Super+c -> Ctrl+c

        [mouse-bindings]
        # selection-override-modifiers=Shift
        # primary-paste=BTN_MIDDLE
        # select-begin=BTN_LEFT
        # select-begin-block=Control+BTN_LEFT
        # select-extend=BTN_RIGHT
        # select-extend-character-wise=Control+BTN_RIGHT
        # select-word=BTN_LEFT-2
        # select-word-whitespace=Control+BTN_LEFT-2
        # select-row=BTN_LEFT-3

        # vim: ft=dosini
      '';

      ".config/waybar/style.css".text = ''
        * {
          font-family: FontAwesome, Fantasque Sans Mono;
          font-size: 14px;
        }

        window#waybar {
          background-color: rgba(48, 52, 70, 0.5);
          color: #ffffff;
          transition-property: background-color;
          transition-duration: 0.5s; 
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
        #workspaces button
        {
          color: #ffffff;
          border-radius: 5px;
          padding: 2px 9px;
          background-color: #414559;
          font-size: 14px;

          margin-left: 5px;
          margin-right: 5px;

          margin-top: 5px;
          margin-bottom: 5px;
        }

        #workspaces
        {
          color: #ffffff;
          border-radius: 5px;
          padding: 2px 3.5px;
          background-color: #414559;

          margin-left: 5px;
          margin-right: 5px;
          margin-top: 5px;
          margin-bottom: 5px;
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
          color: #c6d0f5;
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
    	        "format": " ",
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

        blurls = waybar

        input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          touchpad {
            disable_while_typing = 0
            natural_scroll = no
            tap-to-click = 1
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        }

        general {

          gaps_in = 5
          gaps_out = 20
          border_size = 2

          layout = dwindle
        }

        decoration {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

          rounding = 5
          blur = yes
          blur_size = 13
          blur_passes = 3
          blur_new_optimizations = on

          drop_shadow = yes
          shadow_range = 20
          shadow_render_power = 3
          col.shadow = 85c1dc
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
