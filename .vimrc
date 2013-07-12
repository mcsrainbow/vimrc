"" 文件名: .vimrc
"" 日期: Fri 19 Apr 2013 01:51:30 PM CST
"" 作者: Shanjie Luo, Dong Guo


""快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab                        " 插入模式下的语法结构补全 [pydiction插件]
" Shift + Insert             " 向Vim中粘贴从别处复制的内容
" za                         " 打开或关闭当前折叠
" zM                         " 关闭所有折叠
" zR                         " 打开所有折叠
" :set syntax=cpp            " 手动选择语法高亮 [或 :set filetype=cpp]


""配置选项
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme inkpot           " 配色模式

set history=400              " 历史操作命令，默认20
set term=xterm-color         " 指定终端
set guifont=Monaco:h10       " 字体&&字号
set tabstop=4                " 设置Tab键的宽度
set shiftwidth=4             " 换行时行间交错使用4个空格
set autoindent               " 自动对齐
set backspace=2              " 设置退格键可用
set cindent shiftwidth=4     " 自动缩进4空格
set smartindent              " 智能自动缩进
set ai                       " 设置自动缩进
set nu                       " 显示行号
set showmatch                " 显示括号配对情况
"set mouse=a                 " 启用鼠标
"set ruler                   " 右下角显示光标位置的状态行
"set incsearch               " 查找book时，当输入/b时会自动找到，开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
"set nowrapscan              " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set vb t_vb=                 " 关闭提示音
set cursorline               " 突出显示当前行
set hidden                   " 允许在有未保存的修改时切换缓冲区

"显示Tab符,使用高亮竖线代替
set list
set listchars=tab:\|\ ,
set expandtab

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

"设置backspace
set backspace=indent,eol,start

"每行超过80个的字符用下划线标示
au BufRead,BufNewFile *.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.py,*.rb,*.erb,*.vim 2match Underlined /.\%81v/

"状态栏显示
set statusline=%F%m\ %r,%Y,%{&fileformat}\ \ \ ASCII=\%b,HEX=\%B\ \ \ Row=%l,Column=%c%V\ %p%%\ \ \ [\ %L\ lines\ in\ all\ ] 

"设置编码
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1

"解决Consle乱码输出问题
language messages zh_CN.utf-8

""插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Taglist
let Tlist_Use_Right_Window = 1                 " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close = 1             " 自动折叠
let Tlist_Show_One_File = 1                    " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow = 1                  " 如果Taglist窗口是最后一个窗口则退出Vim

"通过快捷键<F12>打开Tlist
nnoremap <silent> <F12> :Tlist<CR>

"通过快捷键<F11>打开NERDTree
nnoremap <silent> <F11> :NERDTreeToggle<CR>

"通过快捷键<F9>切换窗口
nnoremap <silent> <F9> <C-W>w

"Python语法结构自动补全 [pydiction]
filetype plugin on
let g:pydiction_location = '~/.vim/data_sources/pydiction/complete-dict'

"Minibufexpl 多文件编辑
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1 


""引号,括号自动匹配 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>

:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>

:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>

":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>

:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

:inoremap ` ``<ESC>i

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf


""自定义函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"加载语法模板和作者,时间信息 [非插入模式]
function MyTitle()
    call append(0, "#!/usr/bin/env python")
    call append(1, "#-*- coding:utf-8 -*-")
    call append(2, "")
    call append(3, "# FileName: ".expand("%"))
    call append(4, "# Date: ".strftime("%c"))
    call append(5, "# Author: Dong Guo")
endf

function MyMain() 
    call append(line("."),   "def main():")
    call append(line(".")+1, "")
    call append(line(".")+2, "if __name__=='__main__':")
    call append(line(".")+3, "    main()")
endf

"映射到快捷键
map <F2> <Esc>:call MyTitle()<CR><Esc>
map <F3> <Esc>:call MyMain()<CR><Esc>

