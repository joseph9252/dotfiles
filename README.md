# Dotfiles

Personal configuration files

## Setup on a new machine

```bash
# Clone the repo
cd ~
git clone https://github.com/YOUR_USERNAME/dotfiles.git

# Create symlinks
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

# Install tmux (if not installed)
brew install tmux

# Reload tmux config (if already in tmux)
tmux source-file ~/.tmux.conf
```

## Files

- `tmux.conf` - tmux configuration
