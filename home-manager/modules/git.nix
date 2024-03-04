{...}: {
  programs.git = {
    enable = true;
    userName = "chinh4thepro";
    userEmail = "chinh4thepro@gmail.com";
    lfs.enable = true;
    delta.enable = true;
    delta.options = {
      side-by-side = true;
    };
    extraConfig = {
      color = {
        ui = "auto";
      };
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = true;
      };
      checkout = {
        workers = 8;
      };
    };
  };
}

