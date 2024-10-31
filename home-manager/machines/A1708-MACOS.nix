{
  pkgs,
  lib,
  ...
}: {
  home = {
    username = "chinh4thepro";
    homeDirectory = "/Users/chinh4thepro";
    stateVersion = "22.11";
    enableNixpkgsReleaseCheck = true;
  };

  programs.home-manager.enable = true;

  # Helps with non nixOS issues
  # targets.genericLinux.enable = true;

  imports = [
    ../modules/default.nix
    ../modules/apps
    ../modules/office.nix
  ];
}
