## Tips

#### 1. For users who just want a vimrc without any plugin, use `vimrc_tiny.vim` instead

```
wget https://raw.githubusercontent.com/mcsrainbow/vimrc/master/vimrc_tiny.vim -o ~/.vimrc
```

## Instruction

### 1. Install packages

#### On CentOS:

```
sudo yum install vim git ctags
sudo yum upgrade vim-common vim-minimal
sudo pip install pyflakes
```

#### On macOS:

```
brew install vim
brew install git ctags
pip install pyflakes
```

### 2. Install Vundle package

```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### 3. Copy the configuration file

```
git clone https://github.com/mcsrainbow/vimrc
cd vimrc
cp vimrc ~/.vimrc
```

### 4. Install Plugins

```
vim +PluginInstall +qall
```

### 5. Comment out Plugins in .vimrc then Remove Plugins

```
vim +PluginClean +qall
```

### 6. Turn on/off paste-mode by `F6` to paste code without auto-indent and auto-complete

## Screenshot

![image](screenshot.png)
