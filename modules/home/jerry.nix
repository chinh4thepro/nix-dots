{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    mpv
  ];

  imports = [
    inputs.jerry.homeManagerModules.default
  ];

  programs = {
    zathura = {
      enable = true;
    };
    jerry = {
      enable = true;
      config = {
        player = "mpv";
        provider = "allanime";
        manga_format = "pdf";
        manga_opener = "zathura";
      };
    };
  };
}
