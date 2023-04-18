{ config, pkgs, ... }:

let

  powermenu = pkgs.writeScriptBin "powermenu" ''
    entries="Lock\nLogout\nSuspend\nReboot\nShutdown"
    selected=$(echo -e $entries|wofi --width 250 --height 210 --dmenu --cache-file /dev/null | awk '{print tolower($1)}')

    case $selected in
      lock)
        exec swaylock --indicator-thickness 25 --clock --text-color B7D0D3 --text-clear-color B7D0D3 --text-caps-lock-color B7D0D3 --text-ver-color B7D0D3 --text-wrong-color B7D0D3 --inside-color 00000099 --inside-clear-color 00000099 --inside-ver-color 00000099 --inside-wrong-color 00000099 --inside-caps-lock-color 00000099 --ring-color 005950 --separator-color 00000000 --line-clear-color 00000000 --line-caps-lock-color 00000000 --line-ver-color 00000000 --line-wrong-color 00000000 --line-color 00000000  -i /home/chinh4thepro/Pictures/wallpapers/pixels5.gif --effect-blur 10x5;;
      logout)
      # it works okay
        killall Hyprland;;
      suspend)
        exec systemctl suspend & swaylock --indicator-thickness 25 --clock --text-color B7D0D3 --text-clear-color B7D0D3 --text-caps-lock-color B7D0D3 --text-ver-color B7D0D3 --text-wrong-color B7D0D3 --inside-color 00000099 --inside-clear-color 00000099 --inside-ver-color 00000099 --inside-wrong-color 00000099 --inside-caps-lock-color 00000099 --ring-color 005950 --separator-color 00000000 --line-clear-color 00000000 --line-caps-lock-color 00000000 --line-ver-color 00000000 --line-wrong-color 00000000 --line-color 00000000  -i /home/chinh4thepro/Pictures/wallpapers/pixels5.gif --effect-blur 10x5;;
      reboot)
        exec systemctl reboot;;
      shutdown)
        exec systemctl poweroff;;
    esac 
  '';

  rebuild-all = pkgs.writeScriptBin "rebuild-all" ''
    echo "rebuilding nixos"
    doas nixos-rebuild switch
    echo "rebuilding home-manager"
    home-manager switch
  '';

  rebuild-hm = pkgs.writeScriptBin "rebuild-hm" ''
    echo "rebuilding home-manager"
    home-manager switch
  '';

  rebuild-nixos = pkgs.writeScriptBin "rebuild-nixos" ''
    echo "rebuilding nixos"
    doas nixos-rebuild switch
  '';

  nixos-edit = pkgs.writeScriptBin "nixos-edit" ''
    doas nvim /etc/nixos/configuration.nix
  '';

  hm-edit = pkgs.writeScriptBin "hm-edit" ''
    home-manager edit
  '';

  script-edit = pkgs.writeScriptBin "script-edit" ''
    doas nvim /etc/nixos/scripts.nix
  '';

  config-edit = pkgs.writeScriptBin "config-edit" ''
    nvim ~/.config/home-manager/config-files.nix
  '';

  remove-bloat = pkgs.writeScriptBin "remove-bloat" ''
    nix-store --gc
    nix-collect-garbage -d
    doas nix-collect-garbage -d
  '';

in {
  environment = {
    systemPackages = [
      powermenu
      rebuild-all
      nixos-edit
      hm-edit
      script-edit
      config-edit
      remove-bloat
      rebuild-hm
      rebuild-nixos
    ];
  };
}
