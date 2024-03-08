{pkgs, spicetify-nix, ...}:
let
  spicePkgs = spicetify-nix.pkgSets.${pkgs.system};
in {
  programs.spicetify = {
    enable = true;
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ];
    enabledExtensions = with spicePkgs.extensions; [
      lastfm
      genre
      hidepodcasts
      volumePercentage
      adblock
      history
      songStats
      fixEnhance
      playlistIntersection
      shuffle
      powerBar
      fullAlbumDate
      fullAppDisplayMod
      goToSong
      showQueueDuration
    ];
  };
  imports = [
    spicetify-nix.homeManagerModule
  ];
}
