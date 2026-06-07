{ inputs, ... }: {
  flake.nixosModules.core = { pkgs, ... }: {
    nixpkgs.overlays = [
      inputs.nix-cachyos-kernel.overlays.default
    ];

    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

    boot.kernelParams = [
      "nowatchdog"
      "preempt=full"
      "split_lock_detect=off"
    ];

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    services.printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        cnijfilter2
        canon-cups-ufr2
      ];
    };

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}

