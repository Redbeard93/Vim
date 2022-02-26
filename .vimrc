"13/SEP/2021 Updated
"Vimrc注释的语法是"不是#，#会报错
set termguicolors
" You should input actual escape for ^[. Use <Ctrl-V><Esc> to input actual escape."
set t_8f=^[[38;2;%lu;%lu;%lum 
" You should input actual escape for ^[. Use <Ctrl-V><Esc> to input actual escape."
set t_8b=^[[48;2;%lu;%lu;%lum
set path=.,**
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
inoremap { {}<ESC>i<CR><ESC>ko
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap <c-d> <DELETE>

"Open up a terminal at the bottom of current window for execing code test
nnoremap <leader>t :bo terminal<CR> <c-w>:resize 12<CR>

"跳过右括号
inoremap ] <c-r>=SkipSquarebrackets()<CR>
inoremap ) <c-r>=SkipParentheses()<CR>
func SkipParentheses()
    if getline('.')[col('.') - 1] == ')'
        return "\<ESC>la"
    else
        return ")"
    endif
endfunc
func SkipSquarebrackets()
    if getline('.')[col('.') - 1] == ']'
        return "\<ESC>la"
    else
        return "]"
    endif
endfunc

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"tabs manipulating
nn <M-1> 1gt
nn <M-2> 2gt
nn <M-3> 3gt
nn <M-4> 4gt
nn <M-5> 5gt
nn <M-6> 6gt
nn <M-7> 7gt
nn <M-8> 8gt
nn <M-9> 9gt
nn <M-0> :tablast<CR>

"filetree

let g:netrw_winsize = 75
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_list_hide= '^\..*,.*\.swp$,\~$,\.orig$'

nnoremap <leader><tab> :25Lexplore<CR>
nnoremap <leader>fr :vertical resize 30<CR>
nnoremap <leader>wr :vertical resize 90<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>q :q!<CR>

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :25Lexplore
augroup END

"YCM自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_insertion = 1

"Status Bar
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %.33F
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
