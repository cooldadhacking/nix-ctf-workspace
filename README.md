# HTB Devenv LLM Workspace

This repository provides a modular, reproducible development environment for working on Hack The Box (HTB) machines and CTF challenges. It uses [devenv](https://devenv.sh/) and [Nix flakes](https://nixos.wiki/wiki/Flakes) to manage isolated environments by *challenge type* (e.g., `blockchain`, `forensics`, `windows-ad`).  
Designed for power users leveraging local or remote LLM assistants to accelerate CTF and red team workflows. An example-prompt.md file is given for my preferred client. I find that a jailbreak was no longer needed with this as the LLM seems to understand that we are doing "legitimate" hacking. 

## Features

- Challenge type-based dev shells using `devenv` (e.g., `blockchain/`, `forensics/`, etc.)
- Nix flake-powered, fully reproducible toolchains  
- Easily extensible, user/host-agnostic config via Home Manager  
- LLM-first workflow: bring your own agent for reasoning and automation
- Portable for any Linux host with minimal prerequisites

## Usage

1. **Home manager** 
    setup (optional). Make sure to edit in your preferred username
    `home-manager switch --flake .#f4ther`
    

2. **Clone or copy this repository to your system**

3. **Directory Structure**  
   Each HTB challenge *type* (not individual challenge) gets its own subdirectory:
   ```
   /
   ├── flake.nix
   ├── home.nix
   ├── blockchain/
   │   └── devenv.nix
   ├── forensics/
   │   └── devenv.nix
   └── windows-ad/
       └── devenv.nix
   ```
   - You may create even more categories/types as you see fit.

4. **Start a session:**
   - `cd` to the relevant challenge type directory (e.g., `cd forensics`)
   - Run:

     ```sh
     devenv shell
     ```

   - All relevant tools for that *type* will be available in your shell session.

5. **Customize further:**  
   - You can create additional subdirectories or files within each challenge type as you wish.
   - For per-machine notes, either create a directory or keep your workflow within the LLM memory system or as flat files

6. (optional) Have a custom prompt in each directory or a file that an LLM can read. This file can be used to add instructions to your LLM client. Goose can use .goosehints. Or you can create devenv scripts to automatically update your prompts via jinja templates in LM Studio. The LLM can read the devenv.nix file and you can cater your preferred tools this way.

## Caveats

- ⚠️ This setup assumes [fish](https://fishshell.com/) is your primary shell.
    - **Fish shell history** is recorded globally, but each directory’s context means you can easily search your command history per type.
    - For best results, work on each challenge *type* in a separate directory. Give more complicated machines or challenges their own directory.

---

**Happy hacking!**
