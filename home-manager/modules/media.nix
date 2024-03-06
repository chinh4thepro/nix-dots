{pkgs, ...}: {
  home.packages = with pkgs;
  [
    nsxiv
    feh
    mpv
    ani-cli
  ]
  ++ lib.optionals stdenv.isDarwin [
    iina
    xquartz
  ]
  ++ lib.optionals stdenv.isLinux [
  ];
}
