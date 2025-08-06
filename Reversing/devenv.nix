{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    pkgs.ghidra
    pkgs.radare2
    pkgs.cutter
    # binaryninja is not in nixpkgs—install separately if you have a license!
  ];
  enterShell = ''
    exec fish
  '';
}
