{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    pkgs.frida-tools
    pkgs.android-tools   # provides adb
    pkgs.apktool
    # smali/baksmali not in nixpkgs—see official releases if needed
  ];
  enterShell = ''
    exec fish
  '';
}
