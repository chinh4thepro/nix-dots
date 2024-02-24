{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Hardware.
  hardware = {
    facetimehd = {
      enable = true;
    };
    pulseaudio = {
      enable = false;
    };
  };

  # Bootloader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };

  # Networking.
  networking = {
    hostName = "A1708";
    networkmanager = {
      enable = true;
    };
  };

  # Timezone.
  time.timeZone = "America/New_York";

  # Internationalisation.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Services
  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm = {
	  enable = true;
	};
      };
      desktopManager = {
        gnome = {
	  enable = true;
	};
      };
      layout = "us";
      xkbVariant = "mac";
    };
    printing = {
      enable = true;
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
	support32Bit = true;
      };
      pulse = {
        enable = true;
      };
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
    openssh = {
      enable = true;
    };
  };

  sound = {
    enable = true;
  };

  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.chinh4thepro = {
    isNormalUser = true;
    description = "chinh4thepro";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      git
      firefox
      vesktop
      neofetch
      vscodium
      cura
    ];
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
	"flakes"
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.05";

}
