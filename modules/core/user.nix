{inputs, ...}: {
  flake.nixosModules.core = {
    pkgs,
    config,
    ...
  }: {
    imports = [inputs.sops-nix.nixosModules.sops];

    # No multiple users cus... well it's just me
    users.users.mari = {
      isNormalUser = true;
      description = "Hi, hello! It's Mari, the gal who made this thing!";
      shell = pkgs.fish;
      hashedPasswordFile = config.sops.secrets."user-passwords/mari".path;
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
      ];
    };

    environment.systemPackages = [pkgs.sops];

    sops = {
      defaultSopsFile = ./../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";

      age.keyFile = "/home/mari/.config/sops/age/keys.txt";

      secrets = {
        "user-passwords/mari" = {
          neededForUsers = true;
        };
      };
    };
  };
}
