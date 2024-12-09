{pkgs, ...}: {
  # Temporary
  gtk = {
    enable = true;
    iconTheme = {
      name = "Morewaita";
      package = pkgs.morewaita-icon-theme;
    };
  };

  stylix = {
    enable = true;
    autoEnable = true;

    targets = {
      spicetify.enable = false;
    };
  };
}
