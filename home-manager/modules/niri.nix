{
  config,
  pkgs,
  niri,
  ...
}: {
  programs = {
    niri = {
      package = pkgs.niri-stable;
      settings = {
        outputs."eDP-1".scale=1.50;
      };
    };
  };
}
