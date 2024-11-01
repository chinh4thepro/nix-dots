{pkgs, ...}: {
  imports = [
    ./aagl.nix
    ./minecraft.nix
    ./steam.nix
    ./nix-gaming.nix
  ];

  programs = {
    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
    gamescope
  ];
}
