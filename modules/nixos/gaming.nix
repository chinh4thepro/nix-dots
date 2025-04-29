{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gamescope
    graalvm-ce
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    mangohud
    prismlauncher
  ];

  hardware.steam-hardware.enable = true;

  nix.settings = {
    substituters = [
      "https://ezkea.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };

  programs = {
    gamemode.enable = true;
    sleepy-launcher.enable = true;
    steam = {
      enable = true;
      extest.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
