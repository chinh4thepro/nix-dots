{pkgs, ...}: {
  programs.zsh.enable = true;
  users.users.chinh4thepro = {
    isNormalUser = true;
    description = "chinh4thepro";
    extraGroups = ["networkmanager" "wheel" "input" "uinput" "libvirtd" "lpadmin"];
    shell = pkgs.zsh;
    uid = 1000;
  };
}
