{ self, ... }: {
  flake.homeModules.mari = {...}: {
    home = {
      username  = "mari";
      homeDirectory = "/home/mari";
      stateVersion = "26.11";
    };

    imports = with self.homeModules; [
    ];
  };  
}
