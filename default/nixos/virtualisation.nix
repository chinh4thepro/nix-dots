{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    qemu_full
    OVMFFull
    looking-glass-client
  ];

  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 chinh4thepro qemu-libvirtd -"
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
