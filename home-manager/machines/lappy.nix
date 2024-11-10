{pkgs, ...}: {
  imports = [
    ../modules/apps
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

  programs.home-manager.enable = true;

  stylix = {
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/chinh4thepro/walls/main/daydream/daydream.png";
      sha256 = "90a6f922d8998dfdab13649512f53724c4bb95a4cdf4956932a43aa4cb9f4f71";
    };
  };
}
