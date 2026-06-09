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
      self.nixosModules.gui
      self.nixosModules.flatpak
      self.nixosModules.gaming
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "bak";
      users.mari = self.homeModules.mari;
    };
  };
}
