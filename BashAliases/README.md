# Bash Aliases
These are various `.bash_aliases` files that I use for various Linux setups like Docker. Sometimes I find myself needing shorthand commands for Docker if for some reason I need to spin up a new instance. I wanted a place that I could pull my bash aliases from so I didn't need to remember them and rewrite them. Most of them are just shortening long commands like `docker compose` or Rust `cargo` commands

## Usage

```bash
# Install CURL dependency if needed
# sudo apt install curl -y

# Replace <script name> with exact script name from repo. Example: docker_aliases.sh
curl -fsSL https://raw.githubusercontent.com/ToneBone54/congenial-palm-tree/refs/heads/main/BashAliases/<script name> | bash
```
Alternatively, you can dump the script to a local file and make your own edits.
```bash
# EXAMPLE
curl -fsSL https://raw.githubusercontent.com/ToneBone54/congenial-palm-tree/refs/heads/main/BashAliases/docker_aliases.sh -O

# Make executable
chmod +x docker_aliases.sh

# Run after making changes
./docker_aliases.sh
```
After running either method, you will need to restart your CLI session for the aliases to take effect. You can also execute `. ~/.bashrc` to apply them without restarting the session.