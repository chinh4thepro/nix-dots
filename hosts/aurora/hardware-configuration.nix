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

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "uas" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/2d493c8c-cd83-40f4-8b92-56ca32fc952e";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-91500841-05e2-46e5-bd14-41de1a94a5b7".device = "/dev/disk/by-uuid/91500841-05e2-46e5-bd14-41de1a94a5b7";
  boot.initrd.luks.devices."luks-12816c2a-6710-4f6c-ab99-506519ae0adb".device = "/dev/disk/by-uuid/12816c2a-6710-4f6c-ab99-506519ae0adb";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C670-60F7";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/4a71b8f6-9954-4b19-ad53-fea6a575d104";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
