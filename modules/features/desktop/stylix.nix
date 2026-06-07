{ inputs, ... }: {
  flake.nixosModules.stylix = { pkgs, ... }: {
    imports = [ inputs.stylix.nixosModules.stylix ];

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
    ];
    
    stylix = {
      enable = true;
      polarity = "dark";

      base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";

      cursor = {
	package = pkgs.bibata-cursors;
	name = "Bibata-Modern-Classic";
	size = 21;
      };

      fonts = {
	monospace = {
	  package = pkgs.nerd-fonts.jetbrains-mono;
	  name = "JetBrainsMono Nerd Font";
	};

	sansSerif = {
	  package = pkgs.nerd-fonts.jetbrains-mono;
	  name = "JetBrainsMono Nerd Font Propo";
	};

	serif = {
	  package = pkgs.nerd-fonts.jetbrains-mono;
	  name = "JetBrainsMono Nerd Font Propo";
	};

	sizes = {
	  applications = 12;
	  terminal = 12;
	  desktop = 12;
	  popups = 12;
	};

      };
    };
  };
}
