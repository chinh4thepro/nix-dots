{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    qemu_full
    OVMFFull
  ];

  programs.virt-manager.enable = true;
  users.users.chinh4thepro.extraGroups = ["libvirtd"];
  virtualisation.libvirtd.enable = true;
}
