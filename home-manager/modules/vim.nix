{...}: {
  programs.neovim = {
    enable = true;
    vimAlias = false;
    plugins = with pkgs; [
      vimPlugins.vim-nix
    ];
  };
}
