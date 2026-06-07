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

  flake.nixosModules.hostLaptop = { pkgs, ... }: {
    imports = with self.nixosModules; [
      core
    ];
  };
}
