{...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "fantasque sans m nerd font";
      size = "12";
    };
    settings = {
      scrollback_lines = 0;
      enable_audio_bell = false;
      background_opacity = 0.75;
    };
    shellIntegration = {
      enableZshIntegration = true;
    };
  };
}
