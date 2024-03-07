{pkgs, ...}: {
  home.packages = with pkgs;
  [
    mpv
    ani-cli
  ]
  ++ lib.optionals stdenv.isDarwin [
    iina
  ]
  ++ lib.optionals stdenv.isLinux [
    nsxiv
    feh
  ];
}
