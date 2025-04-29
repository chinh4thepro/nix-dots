{...}: {
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 0;
      enable_audio_bell = false;
      background_blur = 1;
      window_padding_width = 10;
      close_child_on_death = "yes";
    };
    shellIntegration = {
      enableZshIntegration = true;
    };
  };
}
