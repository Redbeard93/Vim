"13/SEP/2021 Updated
"Vimrc注释的语法是"不是#，#会报错
set exrc
set backspace=indent,eol,start
set hidden
set expandtab
set smartindent
set nowrap
set incsearch
set clipboard+=unnamedplus
set encoding=utf-8
set shiftwidth=4
set tabstop=4 softtabstop=4
set autoindent
set relativenumber
set textwidth=80
set history =1000
set nu
set colorcolumn=80
set scrolloff=8
set signcolumn=yes
set cuc cul
set wildmode=longest,list,full
set wildmenu
syntax on

filetype indent on
imap { {}<ESC>i<CR><ESC>ko
imap [ []<LEFT>
imap ( ()<LEFT>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight CursorLine term=bold cterm=bold ctermbg=NONE
highlight CursorColumn term=bold cterm=bold ctermbg=NONE
let g:gruvbox_transparent_bg=1

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
augroup Trim
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
