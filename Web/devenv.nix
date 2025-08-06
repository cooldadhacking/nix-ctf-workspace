{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    pkgs.nmap
    pkgs.gobuster
    pkgs.zap
    pkgs.feroxbuster
  ];
  enterShell = ''
    exec fish
  '';
}
