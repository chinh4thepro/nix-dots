{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/apps
    ../modules/apps/davinci.nix
    ../modules/ags.nix
    ../modules/default.nix
    ../modules/hyprland.nix
    ../modules/stylix.nix
    ../modules/distrobox.nix
  ];

  home = {
    username = "chinh4thepro";
    homeDirectory = "/home/chinh4thepro";
    stateVersion = "24.05";
    enableNixpkgsReleaseCheck = false;
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };

  stylix = {
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/chinh4thepro/walls/main/miku/miku.jpg";
      sha256 = "FKadcLtrnvFoFO+iQGB7oQa/5kpoUm034Sn4z9iWUHY=";
    };
  };
}
