{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    pkgs.amass
    pkgs.subfinder
    pkgs.theharvester
    # maltego is unfree—install manually if needed
  ];
  enterShell = ''
    exec fish
  '';
}
