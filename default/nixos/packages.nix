{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    just
    wget
    home-manager
    kdiskmark
  ];

  programs = {
    neovim.enable = true;
  };
}
