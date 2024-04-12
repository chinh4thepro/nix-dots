{
  config,
  pkgs,
  niri,
  ...
}: {
    programs = {
        niri = {
            enable = true;
            settings = {
              outputs."eDP-1".scale=1.50;
            };
        };
    };
}
