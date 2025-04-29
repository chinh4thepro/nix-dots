{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    wget
    home-manager
  ];

  programs = {
    neovim.enable = true;
  };
}
