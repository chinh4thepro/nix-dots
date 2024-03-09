{pkgs, lib, spicetify-nix, ...}:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in {
  programs.spicetify = {
    enable = true;
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ];
    enabledExtensions = with spicePkgs.extensions; [
      lastfm
      volumePercentage
      adblock
      history
      songStats
      playlistIntersection
      shuffle
      powerBar
      fullAlbumDate
      fullAppDisplayMod
      goToSong
      showQueueDuration
    ];
  };
  imports = [ spicetify-nix.homeManagerModule ];
}
