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
      mpv
    ]
    ++ lib.optionals stdenv.isDarwin [
      iina
    ]
    ++ lib.optionals stdenv.isLinux [
      elisa
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
