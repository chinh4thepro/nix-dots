{pkgs, ...}: {
  home.packages = with pkgs;
  [
    mpv
    ani-cli
    spotify
    spicetify-cli
  ]
  ++ lib.optionals stdenv.isDarwin [
    iina
  ]
  ++ lib.optionals stdenv.isLinux [
    nsxiv
    feh
  ];
}
