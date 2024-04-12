{
  config,
  pkgs,
  ...
}: {
    nixpkgs = {
      overlays = [
        inputs.niri.overlays.niri
      ];
    };

    programs = {
        niri = {
            enable = true;
            package = niri-stable;
        };
    };
}
