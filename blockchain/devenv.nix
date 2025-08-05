{ pkgs, ... }:

{
  packages = [
    pkgs.solc
    pkgs.go-ethereum
    pkgs.nodejs_20
  ];
  enterShell = ''
    # install truffle in shell if missing (npm global, for one-off use)
    if ! command -v truffle > /dev/null; then
      echo "Installing Truffle via npm..."
      sudo npm install -g truffle
    fi
    exec fish
  '';
}
