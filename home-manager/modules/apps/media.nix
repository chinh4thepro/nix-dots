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
      feh
      playerctl
      obs-studio
    ];
}
