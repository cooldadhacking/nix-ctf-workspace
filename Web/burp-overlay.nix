self: super: {
  burpsuite-pro = super.stdenv.mkDerivation {
    pname = "burpsuite-pro";
    version = "2024";
    src = ./burpsuite_pro.jar;
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out/bin
      # Copy jar to output path
      cp $src $out/burpsuite_pro.jar
      # Make a wrapper script for easy CLI/GUI launch
      cat > $out/bin/burpsuite-pro <<EOF
#!/bin/sh
exec ${super.jre}/bin/java -jar "$out/burpsuite_pro.jar" "$@"
EOF
      chmod +x $out/bin/buruite-pro
    '';
    meta = with super.lib; {
      description = "Burp Suite Pro (user-supplied jar)";
      license = licenses.unfree;
      platforms = platforms.linux ++ platforms.darwin;
    };
  };
}
