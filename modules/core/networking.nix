{
  flake.nixosModules.core = { lib, ... }: {
    networking = {
      hostName = "nixos";

      networkmanager = {
	enable = true;
	settings = {
	  device = {
	    "wifi.scan-rand-mac-address" = "yes";
	  };
	  connection = {
	    "wifi.cloned-mac-address" = "random";
	    "ethernet.cloned-mac-address" = "random";
	  };
	};
      };

      firewall = {
	enable = true;
	allowedTCPPorts = [ ];
	allowedUDPPorts = [ ];
      };

      nameservers = [
	"1.1.1.1" 
	"9.9.9.9"
      ];
    };

    time.timeZone = "Europe/Rome";

    i18n.defaultLocale = "en_GB.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };

    # Sometimes setting a different keyboard layout can cause conflicts, so I use mkDefault
    console.keyMap = lib.mkDefault "it"; 
    services.xserver.xkb = {
      layout = lib.mkDefault "it";
      variant = "";
    };

  };
}

