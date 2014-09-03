1. Install packages
---
sudo yum install vim git ctags

2. Install Vundle package
---
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

3. Copy the configuration file and color schemes
---
cp vimrc ~/.vimrc
cp -r vim ~/.vim

4. Install Plugins
---
vim +PluginInstall +qall

5. Comment out Plugins in .vimrc then Remove Plugins
---
vim +PluginClean +qall
