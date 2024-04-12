{
  config,
  pkgs,
  niri,
  ...
}: {
    programs = {
        niri = {
            settings = {
              outputs."eDP-1".scale=1.50;
            };
        };
    };
}
