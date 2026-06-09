{inputs, ...}: {
  flake.nixosModules.gui = {...}: {
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;
  };
  flake.homeModules.gui = {pkgs, ...}: {
    imports = [inputs.noctalia.homeModules.default];

    programs.noctalia-shell = {
      enable = true;
    };

    home.packages = with pkgs; [
      nautilus
    ];
  };
}
