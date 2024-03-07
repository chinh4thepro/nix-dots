{...}: {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      lastfm
      genre
      hidepodcasts
    ];
  };
}
