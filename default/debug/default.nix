{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  services= {
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };
  };
}
