{
  inputs,
  pkgs,
  zen-browser,
  ...
}: {
  home.packages = [
    inputs.zen-browser.packages.${pkgs.system}.zen-browser
  ];
}
