{inputs, ...}: {
  flake.nixosModules.core = {pkgs, ...}: {
    nixpkgs.overlays = [
      inputs.nix-cachyos-kernel.overlays.default
    ];

    # boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

    boot.kernelParams = [
      "nowatchdog"
      "preempt=full"
      "split_lock_detect=off"
    ];

    hardware = {
      bluetooth = {
        enable = true;
        powerOnBoot = true;
      };

      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          intel-media-driver
          vpl-gpu-rt
        ];
      };
    };

    services = {
      printing = {
        enable = true;
        drivers = with pkgs; [
          gutenprint
          cnijfilter2
          canon-cups-ufr2
        ];
      };

      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
