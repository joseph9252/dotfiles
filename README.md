# Dotfiles

Personal configuration files

## Setup on a new machine

```bash
# Clone the repo
cd ~
git clone git@github.com:joseph9252/dotfiles.git

# Create symlinks
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/zshrc ~/.zshrc

# Setup secrets file (important!)
cp ~/dotfiles/secrets.template ~/.secrets
# Edit ~/.secrets and add your actual API keys and tokens

# Install tmux (if not installed)
brew install tmux

# Reload configs
tmux source-file ~/.tmux.conf  # if in tmux
source ~/.zshrc                # reload zsh
```

## Files

- `tmux.conf` - tmux configuration
- `vimrc` - vim configuration
- `zshrc` - zsh shell configuration
