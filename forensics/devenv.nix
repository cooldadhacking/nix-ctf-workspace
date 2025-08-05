{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    pkgs.binwalk
    pkgs.tshark
    pkgs.exiftool
    pkgs.bulk_extractor
  ];
  enterShell = ''
    exec fish
  '';
}
