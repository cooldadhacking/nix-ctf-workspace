{ stdenv, fetchurl, binutils, gnutar, zstd, ffmpeg, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "goose";
  version = "1.0.28";

  src = fetchurl {
    url = "https://github.com/block/goose/releases/download/v1.0.28/goose_1.0.28_amd64.deb";
    sha256 = "0ksf5x9pxijl6kx4b76rv7mr9ynr7bqj3rv6qbbnllkdyr3bmbj7";
  };

  nativeBuildInputs = [ binutils gnutar zstd makeWrapper ];
  buildInputs = [ ffmpeg ];

  unpackPhase = ''
    ar x $src
    tar xf data.tar.* 
  '';

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/lib/goose
    cp usr/bin/goose $out/bin/
    cp usr/lib/goose/libffmpeg.so $out/lib/goose/
    cp usr/lib/goose/icudtl.dat $out/lib/goose/
    cp usr/lib/goose/icudtl.dat $out/bin/
    wrapProgram $out/bin/goose --set LD_LIBRARY_PATH "$out/lib/goose"
  '';

  meta = {
    description = "Goose CLI from upstream deb asset";
    homepage = "https://github.com/block/goose";
    license = [ "MIT" ];
    platforms = [ "x86_64-linux" ];
  };
}
