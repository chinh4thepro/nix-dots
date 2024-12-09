{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.jerry.homeManagerModules.default
    ./spotify.nix
  ];

  home.packages = with pkgs;
    [
    ]
    ++ lib.optionals stdenv.isDarwin [
      iina
    ]
    ++ lib.optionals stdenv.isLinux [
      elisa
      mpv
      feh
      playerctl
      obs-studio
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
