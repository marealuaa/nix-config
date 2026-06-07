{ self, ... }: {
  flake.nixosModules.core = { pkgs, ... }: {
    # No multiple users cus... well it's just me
    users.users.mari = {
      isNormalUser = true;
      description = "Hi, hello! It's Mari, the gal who made this thing!";
      # shell = pkgs.fish;
      extraGroups = [
	"wheel"
	"networkmanager"
	"video"
      ];
    };
  };
}
