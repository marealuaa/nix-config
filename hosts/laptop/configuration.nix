{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostLaptop
    ];
  };

  flake.nixosModules.hostLaptop = {...}: {
    imports = [
      inputs.home-manager.nixosModules.home-manager

      self.nixosModules.core
      self.nixosModules.pipewire
      self.nixosModules.shell
      self.nixosModules.stylix
      self.nixosModules.niri
      self.nixosModules.noctalia
      self.nixosModules.flatpak
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "bak";
      users.mari = self.homeModules.mari;
    };
  };
}
