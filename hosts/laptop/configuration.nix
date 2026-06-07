{ inputs, self, ... }: {
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [ 
      self.nixosModules.hostLaptop
    ];
  };  

  flake.nixosModules.hostLaptop = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      self.nixosModules.core
      self.nixosModules.pipewire
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.mari = self.homeModules.mari;
    };
  };
}
