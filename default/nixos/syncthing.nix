{...}: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    dataDir = "/home/chinh4thepro/Documents/syncthing";
    configDir = "/home/chinh4thepro/.config/syncthing";
    user = "chinh4thepro";
  };
}