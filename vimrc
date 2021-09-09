"Vimrc注释的语法是"不是#，#会报错
set exrc
set hidden
set expandtab
set smartindent
set nowrap
set incsearch
set scrolloff=8
set clipboard+=unnamedplus
set cuc
set encoding=utf-8
set shiftwidth=4
set softtabstop=4
set tabstop=4
syntax on
set t_Co=256
filetype indent on
set autoindent
set relativenumber
set cursorline
set cursorcolumn
highlight CursorLine term=bold cterm=bold ctermbg=DarkGray
highlight CursorColumn ctermbg=DarkGray
set textwidth=80
set ruler
set showmatch
set history =1000
set wildmenu
set wildmode=longest:list,full
set nu
set nocompatible
"设置backspace可以正常使用
set backspace=indent,eol,start
"insert模式下设置大括号自动缩进
imap {<CR> {<CR>}<ESC>O
"insert模式下设置中括号缩进
imap [ []<ESC>i
"insert模式下设置小括号缩进
imap ( ()<ESC>i
"insert模式下输入一个[相当于输入一个完整[]再将光标左移一个字符
imap [ []<LEFT>
imap ( ()<LEFT>
call plug#begin()


call plug#end()
