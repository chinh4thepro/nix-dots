{...}: {
  programs.git = {
    enable = true;
    userName = "chinh4thepro";
    userEmail = "chinh4thepro@gmail.com";
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
