{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    just
    wget
    home-manager
  ];

  programs = {
    neovim.enable = true;
  };
}
