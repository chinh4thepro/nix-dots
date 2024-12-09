# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "ahci" "xhci_pci" "usbhid" "uas" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5d71f623-4ee1-4c99-8057-cdc0c74905ee";
    fsType = "ext4";
    options = ["discard" "noatime"];
  };

  boot.initrd.luks.devices = {
    "luks-473d7c51-f394-4466-8da7-fa5359a5a904" = {
      device = "/dev/disk/by-uuid/473d7c51-f394-4466-8da7-fa5359a5a904";
      allowDiscards = true;
      preLVM = true;
    };
    "luks-117625a8-c469-4174-92e1-583893130004" = {
      device = "/dev/disk/by-uuid/117625a8-c469-4174-92e1-583893130004";
      allowDiscards = true;
      preLVM = true;
    };
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/FB8A-A47C";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/3a770dc7-ebdb-4b90-8b6b-d00f829b32d1";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp14s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp15s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
