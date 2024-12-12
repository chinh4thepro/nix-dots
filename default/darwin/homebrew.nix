{...}: {
  environment.variables.HOMEBREW_NO_ANALYTICS = "1";

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    brews = [
      "mas"
      "python"
      "python-tk"
    ];

    taps = [
      "nikitabobko/tap"
    ];

    casks = [
      "aerospace"
      "zen-browser"
      "raycast"
    ];

    masApps = {};
  };
}
