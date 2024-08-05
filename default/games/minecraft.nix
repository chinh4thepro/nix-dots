{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    graalvm-ce
  ];
}