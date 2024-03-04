{pkgs, ...}: {
  home.packages = with pkgs; 
  [
    ani-cli
  ]
  ++ lib.optionals stdenv.isDarwin [
    iina
  ]
  ++ lib.optionals stdenv.isLinux [
    mpv
  ];
}
