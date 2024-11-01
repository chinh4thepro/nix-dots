{aagl, ...}: {
  nixConfig = {
    extra-substituters = ["https://ezkea.cachix.org"];
    extra-trusted-public-keys = ["ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="];
  };

  programs = {
    anime-games-launcher.enable = true;
    sleepy-launcher.enable = true;
  };
}
