{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    pkgs.hashcat
    pkgs.john
    pkgs.openssl
    pkgs.gmp
  ];
  enterShell = ''
    exec fish
  '';
}
