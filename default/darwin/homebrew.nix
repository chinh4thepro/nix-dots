{...}: {
  environment.variables.HOMEBREW_NO_ANALYTICS = "1";

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    taps = [
      "nikitabobko/tap"
      "FelixKratz/formulae"
    ];

    brews = [
      "mas"
      "python"
      "python-tk"
      "borders"
      "gnu-sed"
    ];

    casks = [
      "zen-browser"
      "raycast"
    ];

    masApps = {};
  };
}
