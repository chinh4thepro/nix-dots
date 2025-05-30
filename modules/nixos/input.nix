{pkgs, ...}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    # enabled = "true";
    # type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-bamboo
        fcitx5-gtk
        fcitx5-mozc
        fcitx5-with-addons
      ];
      waylandFrontend = true;
    };
  };
}
