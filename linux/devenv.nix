{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    pkgs.htop
    pkgs.tmux
    pkgs.nmap
  ];
  enterShell = ''
    exec fish
  '';
}
