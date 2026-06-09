{inputs, ...}: {
  flake.nixosModules.noctalia = {...}: {
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;
  };
  flake.homeModules.noctalia = {pkgs, ...}: {
    imports = [inputs.noctalia.homeModules.default];

    programs.noctalia-shell = {
      enable = true;
    };

    home.packages = with pkgs; [
      nautilus
    ];
  };
}
