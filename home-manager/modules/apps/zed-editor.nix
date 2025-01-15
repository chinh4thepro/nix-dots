{...}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "git-firefly"
      "zig"
      "scss"
    ];
  };
}
