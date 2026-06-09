{inputs, ...}: {
  flake.nixosModules.secrets = {...}: {
    imports = [inputs.sops-nix.nixosModules.sops];

    sops = {
      defaultSopsFile = ./../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";

      age.keyFile = "/home/mari/.config/sops/age/keys.txt";

      secrets = {
        "user-passwords/mari" = {
          neededForUsers = true;
        };
        "github/tokens/nix-config" = {
          owner = "mari";
        };
      };
    };
  };
}
