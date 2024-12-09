{
  pkgs,
  nixvim,
  ...
}: {
  imports = [
    nixvim.homeManagerModules.nixvim
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.nixvim = {
    enable = true;

    plugins = {
      lualine.enable = true;
      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          lua-ls.enable = true;
          rust-analyzer.enable = true;
        };
      };
      telescope.enable = true;
      oil.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
    ];
  };
}
