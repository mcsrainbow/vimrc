""Use Vundle to manage VIM plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Compatible settings
set nocompatible
filetype off

"Environment setting
set rtp+=~/.vim/bundle/Vundle.vim

"Vundle BEGIN
call vundle#begin()

"Use Vundle to manage itself
Plugin 'VundleVim/Vundle.vim'

"Use Vundle to manage VIM plugins which on GitHub(optional)
Plugin 'scrooloose/nerdtree'           "NERDTree
Plugin 'jistr/vim-nerdtree-tabs'       "NERDTree Tabs
Plugin 'fholgado/minibufexpl.vim'      "MiniBufExpl
Plugin 'vim-scripts/taglist.vim'       "Based on ctags
Plugin 'vim-scripts/pyflakes'          "Pyflakes
Plugin 'davidhalter/jedi-vim'          "Jedi Python autocompletion
Plugin 'pearofducks/ansible-vim'       "Ansible syntax

"Use Vundle to download the color schemes which on GitHub, recommended by http://cocopon.me/app/vim-color-gallery/(optional)
Plugin 'ciaranm/inkpot'                    "inkpot color scheme
Plugin 'mcsrainbow/vivify-inkpot'          "vivify-inkpot color scheme
Plugin 'nanotech/jellybeans.vim'           "jellybeans color scheme
Plugin 'altercation/vim-colors-solarized'  "solarized color scheme

"Vundle END
call vundle#end()
"Turn on plugins
filetype plugin indent on

""Options(optional)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme inkpot                "Use inkpot color scheme
colorscheme vivify-inkpot         "Use vivify-inkpot color scheme
"colorscheme jellybeans            "Use jellybeans color scheme
"colorscheme solarized             "Use solarized color scheme
set background=dark          "Use dark background color for terminal
set history=600              "The command-lines that you enter are remembered in a history table
set expandtab                "Use spaces instead of tabs
set tabstop=4                "1 tab == 4 spaces
"set smarttab                 "Be smart when <Tab> in front of a line inserts blanks
set shiftwidth=4             "Number of spaces to use for each step of (auto)indent
set autoindent               "Copy indent from current line when starting a new line
"set smartindent              "Do smart autoindenting when starting a new line
"set nu                       "Show line numbers
set showmatch                "Show matching brackets when text indicator is over them
"set mouse=a                  "Enable the use of the mouse
set ruler                    "Always show current position
set incsearch                "Makes search act like search in modern browsers
set hlsearch                 "Highlight search results
"set smartcase                "When searching try to be smart about cases
"set ignorecase               "Ignore case when searching
"set nowrapscan               "Do not wrap around when searching
set cursorline               "Highlight the current line
set cursorcolumn             "Highlight the current column
set hidden                   "A buffer becomes hidden when it is abandoned
"set wildmenu                 "Turn on the wild menu
"set cmdheight=1              "Number of screen lines to use for the command-line
"set foldcolumn=1             "Add a bit extra margin to the left
"set autowrite                "Auto saves changes when quitting and swiching buffer
set nowrap                   "Do not wrap lines
"set backup                   "Keep a backup file with suffix ~
"set noswapfile               "Do not use a swapfile for the buffer
"set autochdir                "Change the current working directory
"set equalalways              "Makes all the windows the same size after a window is split or closed
set maxmempattern=2000000    "Set the Maximum amount of memory (in Kbyte) to use for pattern matching
set backupcopy=yes           "Avoid the inode value changes

"Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

"Turn off annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"Change the indentation behavior based on the file type
autocmd Filetype css,html,javascript,ruby,sh,vim,xml,yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go setlocal noexpandtab tabstop=8 shiftwidth=8

"Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Enable syntax highlighting
syntax enable
syntax on

"Underline the characters at column 80
"au BufRead,BufNewFile *.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.py,*.rb,*.erb,*.vim 2match Underlined /.\%81v/

"Customize the status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2             "Always show status line

"Automatic detection will be done when reading a file
set fileformats=unix,dos,mac

"Default file encoding
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1

"Set the current language
language messages en_US.utf-8

"Turn on/off paste-mode by <F6> to paste code without auto-indent and auto-complete
set pastetoggle=<F6>

"Show extra spaces at the end of a line and unprintable Tab characters as visible small squares
set listchars=tab:\|\■,trail:■
set list

"Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

":W sudo saves the file to handle the permission-denied error
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

""Plugins(optional)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Taglist
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1

"Jedi Python autocompletion
let g:jedi#completions_enabled = 1                     "Enable Jedi autocompletion
autocmd FileType python setlocal completeopt-=preview  "Disable the docstring window to popup during completion

"Set Ansible inventory file with filetype 'ansible_hosts'
au BufRead,BufNewFile hosts.*,hosts/* setlocal filetype=ansible_hosts

"Highlight more additional keywords in Ansible playbooks
let g:ansible_extra_keywords_highlight = 1

"Map Taglist to <F10>
nnoremap <silent> <F10> :Tlist<CR>

"Map NERDTree Tabs to <F9>
nnoremap <silent> <F9> :NERDTreeTabsToggle<CR>

"Map <C-W> to <F8>
nnoremap <silent> <F8> <C-W>w

"Map Pyflakes to <F7>
autocmd FileType python map <buffer> <F7> :call Pyflakes()<CR>

"MiniBufExpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

""Map auto complete of (), {}, [], <>, "", '', ``(optional)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>

:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>

:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>

":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>

":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i

":inoremap ` ``<ESC>i

function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

""Custom functions(optional)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function CreateInfo()
  call append(0, "#!/usr/bin/env python")
  call append(1, "#-*- coding:utf-8 -*-")
  call append(2, "")
  call append(3, "# Description: ")
  call append(4, "# Author: Damon Guo")
  call append(5, "# Last modified: ".strftime("%F %H:%M %Z"))
  call append(6, "")
endf

function UpdateInfo()
  execute '/# *Last modified:/s@:.*$@\=strftime(": %F %H:%M %Z")'
endf

function MyInfo()
  let n = 1
  while n < 10
    let line = getline(n)
    if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
      call UpdateInfo()
      return
    endif
    let n = n + 1
  endwhile
  call CreateInfo()
endf

function MyMain() 
  call append(line("."),   "import os")
  call append(line(".")+1, "import sys")
  call append(line(".")+2, "")
  call append(line(".")+3, "def parse_opts():")
  call append(line(".")+4, "    \"\"\"Help messages(-h, --help).\"\"\"")
  call append(line(".")+5, "    ")
  call append(line(".")+6, "    import textwrap")
  call append(line(".")+7, "    import argparse")
  call append(line(".")+8, "    ")
  call append(line(".")+9, "    parser = argparse.ArgumentParser(")
  call append(line(".")+10, "        formatter_class=argparse.RawDescriptionHelpFormatter,")
  call append(line(".")+11, "        description=textwrap.dedent(")
  call append(line(".")+12, "        '''")
  call append(line(".")+13, "        '''.format(__file__)")
  call append(line(".")+14, "        ))")
  call append(line(".")+15, "    ")
  call append(line(".")+16, "    args = parser.parse_args()")
  call append(line(".")+17, "    return {}")
  call append(line(".")+18, "")
  call append(line(".")+19, "def main():")
  call append(line(".")+20, "    if len(sys.argv) < 2:")
  call append(line(".")+21, "        os.system(__file__ + ' -h')")
  call append(line(".")+22, "        return 2")
  call append(line(".")+23, "    ")
  call append(line(".")+24, "    opts = parse_opts()")
  call append(line(".")+25, "    return 0")
  call append(line(".")+26, "")
  call append(line(".")+27, "if __name__ == '__main__':")
  call append(line(".")+28, "    sys.exit(main())")
endf

autocmd FileType python map <F2> <Esc>:call MyInfo()<CR><Esc>
autocmd FileType python map <F3> <Esc>:call MyMain()<CR><Esc>
