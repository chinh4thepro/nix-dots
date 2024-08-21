{...}: {
  services.syncthing = {
    enable = true;
    user = "chinh4thepro";
    openDefaultPorts = true;
    dataDir = "/home/chinh4thepro/Documents/syncthing";
    configDir = "/home/chinh4thepro/.config/syncthing";
  };
}
