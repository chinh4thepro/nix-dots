{pkgs, ...}: {
  imports = [
    ./aagl.nix
  ];

  programs = {
    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    prismlauncher
    graalvm-ce
    mangohud
  ];
}
