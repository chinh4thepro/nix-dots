{...}: {
  imports = [
    ./aliases.nix
  ];
  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";

    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "gentoo";
      plugins = [
        "git"
      ];
    };

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 20000;
      size = 20000;
      share = true;
    };
  };
}
