{inputs,pkgs, ...}: {
  imports = [inputs.jerry.homeManagerModules.default];

  home.packages = with pkgs; [
    spicetify-cli
    obs-studio
    imv
  ]
  ++ lib.optionals stdenv.isDarwin [
    iina
  ]
  ++ lib.optionals stdenv.isLinux [
    amberol
    mpv
  ];
  programs = {
    zathura = {
      enable = true;
    };
    jerry = {
      enable = true;
      config = {
	provider = "allanime";
	manga_format = "pdf";
	manga_opener = "zathura";
      };
    };
  };
}
