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
    };
    desktopManager.plasma6.enable = true;
  };
}
