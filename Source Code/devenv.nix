{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    pkgs.ctags
    pkgs.semgrep
    pkgs.gitleaks
  ];
  enterShell = ''
    exec fish
  '';
}
