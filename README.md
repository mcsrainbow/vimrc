## Tips

#### For users who want a vimrc without any plugin, use `vimrc_tiny.vim` instead:

```
wget https://raw.githubusercontent.com/mcsrainbow/vimrc/master/vimrc_tiny.vim -O ~/.vimrc
```

#### For `solarized` and `base16` color schemes, check out their source repositories for advanced usage:

https://github.com/altercation/vim-colors-solarized  
https://github.com/chriskempson/base16-vim

#### For users who want to remove all, just delete the `~/.vimrc` and directory `~/.vim`

#### Inspired by

https://github.com/amix/vimrc

## Instruction

### 1. Install packages

```bash
# Ubuntu
sudo apt install vim git ctags pyflakes

# CentOS
sudo yum install vim git ctags pyflakes
sudo yum upgrade vim-common vim-minimal

# macOS
brew install vim git ctags
pip install pyflakes
```

### 2. Install Vundle package

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### 3. Copy the configuration file

```bash
git clone https://github.com/mcsrainbow/vimrc
cp vimrc/vimrc ~/.vimrc
```

### 4. Install Plugins

```bash
vim +PluginInstall +qall
```

### 5. Comment out Plugins in .vimrc then Remove Plugins

```bash
vim +PluginClean +qall
```

### 6. Turn on/off paste-mode by `F6` to paste code without auto-indent and auto-complete

## Screenshot

![image](screenshot.png)
