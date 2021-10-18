"13/SEP/2021 Updated
"Vimrc注释的语法是"不是#，#会报错
set suffixesadd=.java
set nocompatible
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
set showcmd
syntax on
filetype plugin indent on

let mapleader = " "
imap { {}<ESC>i<CR><ESC>ko
imap [ []<LEFT>
imap ( ()<LEFT>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"filetree
nnoremap <leader>ft :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>fr :vertical resize 30<CR>
nnoremap <leader>wr :vertical resize 90<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :q!<CR>
let g:netrw_browse_split = 3
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_list_hide= '^\..*,.*\.swp$,\~$,\.orig$'

"Status Bar
set laststatus=2
set statusline=
set statusline+=%.33F
set statusline+=\ -
set statusline+=\ FileType:
set statusline+=%y
set statusline+=%=
set statusline+=\ [%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ -
set statusline+=%l
set statusline+=\ |
set statusline+=%c
set statusline+=\ %L


call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'ycm-core/YouCompleteMe'
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

augroup Java
    autocmd!
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END
