{pkgs, ...}: {
  imports = [
  ];

  home.packages = with pkgs; [
    curl
    unrar
    pywal
  ];
}
