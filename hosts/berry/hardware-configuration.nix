{
  config,
  lib,
  pkgs,
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
    device = "/dev/disk/by-uuid/eea6fd9f-4ace-4ddf-93aa-4712a0cfe23e";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-0fbc7441-1646-40ec-a260-d546be0e640d".device = "/dev/disk/by-uuid/0fbc7441-1646-40ec-a260-d546be0e640d";
  boot.initrd.luks.devices."luks-1e5bc8fd-5c29-4fa9-9e64-884d55547257".device = "/dev/disk/by-uuid/1e5bc8fd-5c29-4fa9-9e64-884d55547257";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/A4F5-8C52";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/de5918b9-9501-422b-a37f-df100cb22e5a";}
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
