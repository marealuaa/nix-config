{
    description = "My post accidental nuke config! This probably still sucks but hey, I tried";
    inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";	

	flake-parts.url = "github:hercules-ci/flake-parts";

	home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
	};

	stylix = {
	    url = "github:nix-community/stylix";
	    inputs.nixpkgs.follows = "nixpkgs";
	};

	nvf = {
	    url = "github:notashelf/nvf";
	    inputs.nixpkgs.follows = "nixpkgs";
	};

	# Unused for now
	sops-nix = {
	    url = "github:Mic92/sops-nix";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
    };

    outputs = inputs: let
	inherit (inputs.nixpkgs) lib;
	inherit (lib.fileset) toList fileFilter;
	
	isNixModule = file:
	    file.hasExt "nix"
	    && file.name != "flake.nix"
	    && !lib.hasPrefix "_" file.name;

	importTree = path: toList (fileFilter isNixModule path);
	mkFlake = inputs.flake-parts.lib.mkFlake {inherit inputs;};

	in
	    mkFlake {
		systems = ["x86_64-linux"];
		imports = importTree ./.;
	    };
}
