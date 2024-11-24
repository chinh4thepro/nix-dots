{pkgs, ...}: {
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
    stateVersion = "25.05";
    enableNixpkgsReleaseCheck = true;
  };

  programs.home-manager.enable = true;

  stylix = {
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/chinh4thepro/walls/main/sclera/sanctuary.jpg";
      sha256 = "1dFK2rAlnolhBxEjBQPDUeuELnqslWcn882d4u+Yqos=";
    };
  };
}
