# Bitwarden SSH Agent
set -gx SSH_AUTH_SOCK $HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock

# Android SDK
fish_add_path $HOME/Library/Android/sdk/platform-tools
