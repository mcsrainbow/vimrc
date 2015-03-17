Instruction
---
1. Install packages<br>
`sudo yum install vim git ctags`<br>
`sudo pip install pyflakes`(optional)<br>

2. Install Vundle package<br>
`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`<br>

3. Copy the configuration file<br>
`cp vimrc ~/.vimrc`<br>

4. Copy the popular color schemes on [Bytefluent | Vivify](http://bytefluent.com/vivify/) with "Vim Mode"<br>
`cp -r vim/colors ~/.vim/`<br>

5. Install Plugins<br>
`vim +PluginInstall +qall`<br>

6. Comment out Plugins in .vimrc then Remove Plugins<br>
`vim +PluginClean +qall`<br>

7. Turn on/off paste-mode by F6 to paste code from outside without auto-indent and auto-complete.<br>

Screenshot
---
![image](screenshot.png)
