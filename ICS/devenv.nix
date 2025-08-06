{ pkgs, ... }:

{
  packages = [
    pkgs.fish
    # Add other native/binary tools here if needed
  ];

  languages.python.enable = true;
  languages.python.venv.enable = true;
  languages.python.venv.requirements = ./requirements.txt;

  enterShell = ''
    exec fish
  '';
}
