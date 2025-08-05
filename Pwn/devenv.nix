{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    pkgs.gdb
    pkgs.pwntools
    pkgs.radare2
    pkgs.strace
    pkgs.ghidra
  ];
  enterShell = ''
    exec fish
  '';
}
