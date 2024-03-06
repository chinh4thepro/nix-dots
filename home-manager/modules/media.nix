{pkgs, ...}: {
  home.packages = with pkgs;
  [
    nsxiv
    mpv
  ]
  ++ lib.optionals stdenv.isDarwin [
    iina
    inputs.jerry.packages."x86_64-darwin".jerry
    gnused
  ]
  ++ lib.optionals stdenv.isLinux [
    inputs.jerry.packages."x86_64-linux".jerry
  ];
}
