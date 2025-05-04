{inputs, pkgs, ...}: {
  home.packages = with pkgs; [
    nil
    inputs.nix-qml-support.packages.${pkgs.system}.tree-sitter-qmljs
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "git-firefly"
      "zig"
      "scss"
      "qml"
    ];
    userSettings = {
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "!nixd"
          ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
      };
    };
  };
}
