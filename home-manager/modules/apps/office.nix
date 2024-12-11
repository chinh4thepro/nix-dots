{pkgs, ...}: {
  home.packages = with pkgs;
    [
    ]
    ++ lib.optionals stdenv.isDarwin [
      libreoffice-bin
    ]
    ++ lib.optionals stdenv.isLinux [
      libreoffice
    ];
}
