{config, lib, ...}:
with config.stylix.fonts;
let
  colorNames = [
    "base00"
    "base01"
    "base02"
    "base03"
    "base04"
    "base05"
    "base06"
    "base07"
    "base08"
    "base09"
    "base0A"
    "base0B"
    "base0C"
    "base0D"
    "base0E"
    "base0F"
  ];

  colors = config.lib.stylix.colors.withHashtag;
  defineColor = name: value: "@define-color ${name} ${value};";
in
{
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 50;
        spacing = 10;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "backlight" "battery" "tray" ];

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = true;
          disable-scroll = true;
          sort-by-number = true;
          persistent-workspaces = {
            "*" = 10;
          };
        };

        "clock" = {
          format = "  {:%Y-%m-%d    %H:%M}";
        };

        "backlight" = {
          format = "{icon} {percent}%";
         format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        "battery" = {
          states = {
            "warning" = 30;
            "critical" = 15;
          };
          format = "{icon}  {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-alt = "{icon}  {time}";
          format-icons = ["" "" "" "" ""];
        };

        "pulseaudio" = {
          format = "{icon}  {volume}%  {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        "tray" = {
          spacing = 10;
        };
      };
    };
    style = ''
      * {
        font-family: "${sansSerif.name}";
        font-size: ${builtins.toString sizes.desktop}pt;
      }

      window#waybar {
        margin: 10px;
        border: 2px solid @base0D;
        background: alpha(@base00, ${with config.stylix.opacity; builtins.toString desktop});
      }

      .modules-left > widget:first-child > * {
        margin-left: 5px;
      }

      .modules-right > widget:last-child > * {
        margin-right: 5px;
      }
    ''
    +
    lib.strings.concatStringsSep "\n"
      (
        builtins.map (color: defineColor color colors.${color}) colorNames
      );
  };
}
