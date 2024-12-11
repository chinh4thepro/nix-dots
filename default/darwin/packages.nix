{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    just
    neovim
    wget
    home-manager
  ];
}
