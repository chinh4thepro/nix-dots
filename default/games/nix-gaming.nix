{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = [
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
  ];

  nixConfig = {
    extra-substituters = ["https://nix-gaming.cachix.org"];
    extra-trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
}
