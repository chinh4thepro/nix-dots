{config, lib, inputs, pkgs, ...}:
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
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    configDir = null;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
    ];
  };

  home.file.".config/ags/styles/stylix.css".text = lib.strings.concatStringsSep "\n"
    (
      builtins.map (color: defineColor color colors.${color}) colorNames
    );
}
