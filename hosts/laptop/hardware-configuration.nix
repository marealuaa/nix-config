{
  flake.nixosModules.hostLaptop = { config, lib, pkgs, modulesPath, ... }: {
    imports =
      [ 
	(modulesPath + "/installer/scan/not-detected.nix")
      ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/cc379265-1c84-4ba8-9934-7b2825e754fe";
	fsType = "btrfs";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/BC3D-7F01";
	fsType = "vfat";
	options = [ "fmask=0022" "dmask=0022" ];
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/7cead47d-1452-459e-a8d8-02df6a88564a"; }
      ];

    networking.useDHCP = lib.mkDefault true;
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
