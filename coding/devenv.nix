{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    pkgs.git
    pkgs.neovim
    pkgs.python312
    pkgs.nodejs
  ];
  enterShell = ''
    exec fish
  '';
}
