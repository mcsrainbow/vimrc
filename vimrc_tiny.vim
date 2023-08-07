"Options (optional)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"set cursorcolumn             "Highlight the current column
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
