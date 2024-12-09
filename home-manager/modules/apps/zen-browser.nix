{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
  ] ++ lib.optionals stdenv.isLinux [
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}
