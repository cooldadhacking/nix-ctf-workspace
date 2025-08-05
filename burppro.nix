{ stdenv, fetchurl, jre, lib }:

stdenv.mkDerivation rec {
  pname = "burpsuite-pro";
  version = "2025.1.1";
  src = fetchurl {
    url = "https://portswigger-cdn.net/burp/releases/download?product=pro&type=Jar&version=${version}";
    sha256 = "0000000000000000000000000000000000000000000000000000"; # Replace after first build!
  };
  dontUnpack = true;
  buildInputs = [ jre ];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/burpsuite_pro.jar
    cat > $out/bin/burpsuite-pro <<EOF
#!/bin/sh
exec ${jre}/bin/java -jar "$out/burpsuite_pro.jar" "$@"
EOF
    chmod +x $out/bin/burpsuite-pro
  '';
  meta = with lib; {
    description = "Burp Suite Pro (Pro Edition)";
    license = licenses.unfree;
    platforms = platforms.linux ++ platforms.darwin;
  };
}
