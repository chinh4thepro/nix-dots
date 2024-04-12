{
  config,
  pkgs,
  ...
}: {
    programs = {
        niri = {
            enable = true;
            package = niri-stable;
        }
    }
}
