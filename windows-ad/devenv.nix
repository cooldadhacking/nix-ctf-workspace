{ pkgs, ... }:

{
  packages = [
    pkgs.evil-winrm
    pkgs.rubyPackages.rubyzip
    pkgs.python312Packages.impacket        # Impacket (Python 3.12)
    pkgs.netexec                          # netexec (CrackMapExec fork)
    pkgs.smbclient-ng                     # SMB client
    pkgs.bloodhound                       # BloodHound GUI
    pkgs.bloodhound-py                    # BloodHound-Py Ingestor
    pkgs.python312Packages.bloodyad       # BloodyAD (Active Directory PrivEsc, Python 3.12)
    pkgs.powershell                       # PowerShell
    pkgs.john                             # John the Ripper
    pkgs.hashcat                          # Hashcat
  ];

  enterShell = ''
    mkdir -p .local/share/fish
    ln -sf $HOME/.local/share/fish/fish_history .local/share/fish/fish_history
    exec fish
  '';
}
