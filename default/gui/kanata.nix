{...}: {
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-path/pci-0000:00:1e.3-platform-pxa2xx-spi.3-cs-00-event-kbd" # MBP 2017 keyboard
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
              caps
          )

          (defvar
              tap-time 150
              hold-time 200
          )

          (defalias
              caps (tap-hold $tap-time $hold-time esc lctl)
          )

          (deflayer base
              @caps
          )
        '';
      };
    };
  };
}
