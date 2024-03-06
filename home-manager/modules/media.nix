{pkgs, ...}: {
  home.packages = with pkgs;
  [
    nsxiv
    mpv
  ]
  ++ lib.optionals stdenv.isDarwin [
    iina
  ]
  ++ lib.optionals stdenv.isLinux [
    mpv
  ];
}
