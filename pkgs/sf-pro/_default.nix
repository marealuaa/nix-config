{stdenv, ...}:
stdenv.mkDerivation {
  pname = "sf-pro";
  version = "1.0";

  src = ./.;

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    cp *.otf $out/share/fonts/opentype/
  '';

  meta = {
    description = "Apple San Francisco Pro";
  };
}
