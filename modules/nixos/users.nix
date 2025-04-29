{pkgs, ...}: {
  programs.zsh.enable = true;
  users.users.chinh4thepro = {
    isNormalUser = true;
    description = "chinh4thepro";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
}
