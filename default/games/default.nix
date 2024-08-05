{pkgs, ...}: {
  imports = [
    ./aagl.nix
    ./minecraft.nix
  ];

  programs = {
    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
