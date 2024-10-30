{pkgs, lib, inputs, spicetify-nix, ...}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  programs.spicetify = {
    enable = true;
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      newReleases
      lyricsPlus
      betterLibrary
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
    #enabledSnippets = with spicePkgs.snippets; [
    #  remove-top-spacing
    #];
  };
  imports = [
    spicetify-nix.homeManagerModules.default
  ];
}
