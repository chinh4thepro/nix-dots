{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with 'passwd'.
  programs.zsh.enable = true;
  users.users.chinh4thepro = {
    isNormalUser = true;
    description = "chinh4thepro";
    extraGroups = ["networkmanager" "wheel" "input" "uinput"];
    shell = pkgs.zsh;
    uid = 1000;
  };
}
