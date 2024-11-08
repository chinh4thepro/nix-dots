{pkgs, ...}: {
  fonts.fontDir.enable = true;

  stylix = {
    enable = true;
    autoEnable = true;

    targets = {
        regreet.enable = false;
    };

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
        package = pkgs.nerdfonts.override {fonts = ["FantasqueSansMono"];};
        name = "fantasque sans m nerd font";
      };
      sansSerif = {
        package = pkgs.nerdfonts.override {fonts = ["FantasqueSansMono"];};
        name = "fantasque sans m nerd font";
      };
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["FantasqueSansMono"];};
        name = "fantasque sans m nerd font";
      };
      emoji = {
        package = pkgs.nerdfonts.override {fonts = ["FantasqueSansMono"];};
        name = "Noto Color Emoji";
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };
}
