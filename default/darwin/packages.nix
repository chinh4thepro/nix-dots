{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    just
    neovim
    emacs
    wget
    home-manager
  ];
}
