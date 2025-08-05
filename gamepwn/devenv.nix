{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    pkgs.gdb
    pkgs.qemu
    pkgs.strace
    pkgs.pwntools
  ];
  enterShell = ''
    exec fish
  '';
}
