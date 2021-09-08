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

"Use Vundle to download the color schemes which on GitHub, recommended by http://cocopon.me/app/vim-color-gallery/(optional)
Plugin 'ciaranm/inkpot'                    "inkpot color scheme
"Plugin 'nanotech/jellybeans.vim'           "jellybeans color scheme
"Plugin 'chriskempson/base16-vim'           "base16 color scheme
"Plugin 'altercation/vim-colors-solarized'  "solarized color scheme

"Vundle END
call vundle#end()
"Turn on plugins
filetype plugin indent on

"Options (optional)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme inkpot                "Use inkpot color scheme
"colorscheme jellybeans            "Use jellybeans color scheme
"colorscheme base16-default-dark   "Use base16 color scheme
"colorscheme solarized             "Use solarized color scheme
set background=dark          "Use dark background color for terminal
set history=400              "The command-lines that you enter are remembered in a history table
set expandtab                "Use spaces instead of tabs
set tabstop=4                "1 tab == 4 spaces
"set smarttab                 "Be smart when <Tab> in front of a line inserts blanks
set shiftwidth=4             "Number of spaces to use for each step of (auto)indent
set autoindent               "Copy indent from current line when starting a new line
"set smartindent              "Do smart autoindenting when starting a new line
"set nu                       "Show line numbers
set showmatch                "Show matching brackets when text indicator is over them
"set mouse=a                  "Enable the use of the mouse
"set ruler                    "Always show current position
"set incsearch                "Makes search act like search in modern browsers
set hlsearch                 "Highlight search results
"set smartcase                "When searching try to be smart about cases
"set ignorecase               "Ignore case when searching
"set nowrapscan               "Do not wrap around when searching
set vb t_vb=                 "Turn off visual bell
set cursorline               "Highlight the current line
"set cursorcolumn             "Highlight the current column
set hidden                   "A buffer becomes hidden when it is abandoned
"set wildmenu                 "Turn on the wild menu
"set cmdheight=2              "Number of screen lines to use for the command-line
"set autoread                 "Set to auto read when a file is changed from the outside
"set autowrite                "Auto saves changes when quitting and swiching buffer
set nowrap                   "Do not wrap lines
"set backup                   "Keep a backup file with suffix ~
"set noswapfile               "Do not use a swapfile for the buffer
"set autochdir                "Change the current working directory
"set equalalways              "Makes all the windows the same size after a window is split or closed
set maxmempattern=2000000    "Set the Maximum amount of memory (in Kbyte) to use for pattern matching
set backupcopy=yes           "Avoid the inode value changes

"Change the indentation behavior based on the file type
autocmd Filetype css,html,javascript,ruby,sh,vim,xml,yaml setlocal expandtab tabstop=2 shiftwidth=2

"Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Display unprintable characters: <Tab> as |
set list
set listchars=tab:\|\ ,

"Enable syntax highlighting
syntax enable
syntax on

"Underline the characters at column 80
"au BufRead,BufNewFile *.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.py,*.rb,*.erb,*.vim 2match Underlined /.\%81v/

"Customize the status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set laststatus=2             "Always show status line

"Automatic detection will be done when reading a file
set fileformats=unix,dos,mac

"Default file encoding
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1

"Set the current language
language messages en_US.utf-8

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

"Map Taglist to <F10>
nnoremap <silent> <F10> :Tlist<CR>

"Map NERDTree Tabs to <F9>
nnoremap <silent> <F9> :NERDTreeTabsToggle<CR>

"Map <C-W> to <F8>
nnoremap <silent> <F8> <C-W>w

"Map Pyflakes to <F7>
autocmd FileType python map <buffer> <F7> :call Pyflakes()<CR>

"Turn on/off paste-mode by <F6> to paste code without auto-indent and auto-complete
set pastetoggle=<F6>

"MiniBufExpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1 

""Map auto complete of (), {}, [], <>, "", '', `` (optional)
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
