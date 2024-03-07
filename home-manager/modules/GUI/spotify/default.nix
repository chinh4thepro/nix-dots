{...}: {
  programs.spicetify = {
    enable = true;
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
}
