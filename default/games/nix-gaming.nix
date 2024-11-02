{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = [
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
  ];

  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
}
