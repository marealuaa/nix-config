{inputs, ...}: {
  flake.nixosModules.flatpak = {...}: {
    services.flatpak.enable = true;
  };
  flake.homeModules.apps = {...}: {
    imports = [
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];

    services.flatpak = {
      enable = true;
      uninstallUnmanaged = true;
      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
    };
  };
}
