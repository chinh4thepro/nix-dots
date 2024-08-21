{pkgs, ...}: {
  imports = [
    ./aagl.nix
    ./minecraft.nix
    ./steam.nix
  ];

  programs = {
    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
    gamescope
  ];
}
