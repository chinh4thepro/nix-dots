{pkgs, ...}: {
  home.packages = with pkgs; [
    kicad
    kikit
    turbocase
  ];
}
