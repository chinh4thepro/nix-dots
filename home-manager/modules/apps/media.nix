{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.jerry.homeManagerModules.default
    ./spotify
  ];

  home.packages = with pkgs;
    [
      obs-studio
    ]
    ++ lib.optionals stdenv.isDarwin [
      iina
    ]
    ++ lib.optionals stdenv.isLinux [
      amberol
      mpv
      playerctl
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
