{
  flake.homeModules.apps = {pkgs, ...}: {
    home.packages = with pkgs; [
      bitwarden-cli
      pinentry-gnome3
    ];

    services.flatpak.packages = [
      "com.bitwarden.desktop"
    ];
  };
}
