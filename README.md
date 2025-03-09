# neovim configuration

My neovim configs: contains the essential, the useful, and the weird.

## Environment Variables

This configuration uses a number of environment variables to customize the behavior of Neovim and it's plugins.

```bash
# sets the prefered editor, can't remember for what though
export EDITOR="nvim"

# used to controll platform specific configuration
export NVIM_PLATFORM='UBUNTU_PC'
```

## Dependencies

This configuration requires a few 3rd party dependencies. You can install them all using:

```bash
sudo apt install jq
brew install ripgrep
brew install lazygit
brew install lazydocker
```
