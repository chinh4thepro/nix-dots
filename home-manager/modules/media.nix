{pkgs, ...}: {
  home.packages = with pkgs;
  [
    nsxiv
    mpv
    ani-cli
  ]
  ++ lib.optionals stdenv.isDarwin [
    iina
  ]
  ++ lib.optionals stdenv.isLinux [
  ];
}
