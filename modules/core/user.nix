{self, ...}: {
  flake.nixosModules.core = {
    pkgs,
    config,
    ...
  }: {
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
  };
}
