{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = true;

    polarity = "dark";
    opacity = {
      applications = 0.75;
      desktop = 0.75;
      popups = 0.75;
      terminal = 0.75;
    };
    fonts = {
      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 12;
      };
      serif = {
        package = pkgs.nerd-fonts.fantasque-sans-mono;
        name = "fantasque sans m nerd font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.fantasque-sans-mono;
        name = "fantasque sans m nerd font";
      };
      monospace = {
        package = pkgs.nerd-fonts.fantasque-sans-mono;
        name = "fantasque sans m nerd font";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
