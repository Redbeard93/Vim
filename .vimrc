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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Undo settings

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ColorScheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme gruvbox
"set background=dark
"let g:gruvbox_transparent_bg=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Version 1 cyberpunk high contrast scheme
highlight FoldColumn guibg=#619E9E
highlight Normal ctermbg=NONE guibg=NONE
highlight Pmenu cterm=bold gui=bold ctermbg=NONE guibg=NONE
highlight StatusLine cterm=italic ctermbg=DarkCyan ctermfg=DarkMagenta guibg=#100D23 guifg=#9E619E
highlight StatusLineNC cterm=italic ctermbg=DarkCyan ctermfg=DarkMagenta guibg=#100D23 guifg=#9E619E
highlight TabLineSel cterm=NONE gui=bold ctermbg=DarkCyan ctermfg=DarkMagenta guibg=#9E619E guifg=#100D23
highlight TabLineFill ctermbg=DarkMagenta ctermfg=DarkMagenta guibg=#372963 guifg=#619E9E
highlight TabLine cterm=italic gui=NONE ctermbg=DarkMagenta ctermfg=DarkCyan guibg=#619E9E guifg=#372963
"highlight LineNr cterm=italic ctermbg=NONE guibg=NONE ctermfg=DarkMagenta guifg=NONE
highlight LineNrBelow cterm=italic gui=italic ctermbg=NONE guibg=NONE ctermfg=DarkMagenta guifg=#619E9E
highlight LineNrAbove cterm=italic gui=italic ctermbg=NONE guibg=NONE ctermfg=DarkCyan guifg=#9E619E
highlight CursorLineNr cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=LightYellow guifg=#9E9E61
highlight ColorColumn ctermbg=Black guibg=#100D23
highlight SignColumn ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
highlight CursorLine cterm=bold gui=bold ctermbg=NONE guibg=NONE
highlight CursorColumn cterm=bold gui=bold ctermbg=NONE guibg=NONE
highlight VertSplit cterm=NONE gui=NONE ctermfg=LightYellow guifg=#9E9E61

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Version 2 cyberpunk scheme

"highlight Normal ctermbg=NONE guibg=NONE
"highlight Pmenu cterm=bold gui=bold ctermbg=NONE guibg=NONE
"highlight StatusLine ctermbg=NONE guibg=#9E619E guifg=#100D23
"highlight StatusLineNC ctermbg=NONE guibg=#9E619E guifg=#100D23
"highlight TabLine gui=None ctermbg=NONE guibg=#100D23 guifg=#9E619E
"highlight TabLineFill ctermbg=NONE gui=NONE guibg=#9E619E guifg=#100D23
"highlight TabLineSel ctermbg=NONE gui=bold guibg=#372963 guifg=#619E9E
"highlight LineNr cterm=italic ctermbg=NONE guibg=NONE ctermfg=DarkMagenta guifg=NONE
"highlight LineNrBelow cterm=italic gui=italic ctermbg=NONE guibg=NONE ctermfg=DarkMagenta guifg=#9E619E
"highlight LineNrAbove cterm=italic gui=italic ctermbg=NONE guibg=NONE ctermfg=DarkCyan guifg=#619E9E
"highlight CursorLineNr cterm=bold gui=bold ctermbg=NONE guibg=NONE ctermfg=LightYellow guifg=#9E9E61
"highlight ColorColumn ctermbg=Black guibg=#100D23
"highlight SignColumn ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
"highlight CursorLine cterm=bold gui=bold ctermbg=NONE guibg=NONE
"highlight CursorColumn cterm=bold gui=bold ctermbg=NONE guibg=NONE
"highlight VertSplit cterm=NONE gui=NONE guifg=#9E9E61

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"去掉NonText和EndOfBuffer的~标志nvim only

"for vim try :hi NonText ctermfg=bg guifg=bg |:hi EndOfBuffer ctermfg=bg guifg=bg

set fillchars=eob:\ ,fold:\ ,vert:\|

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open up a terminal window

nnoremap <leader>t :bo terminal<CR> <c-w>:resize 12<CR>
nnoremap <leader>tr :resize 12<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pairs

let mapleader = " "
inoremap { {}<ESC>i<CR><ESC>ko
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap <c-d> <DELETE>
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"move visual selected

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"VERSION 1 (Simple)
 "let g:netrw_winsize = 75
 "let g:netrw_browse_split = 4
 "let g:netrw_liststyle = 3
 "let g:netrw_banner = 0
 "let g:netrw_altv = 1
 "let g:netrw_list_hide= '^\..*,.*\.swp$,\~$,\.orig$'
 "
 "nnoremap <leader><tab> :25Lexplore<CR>
 "nnoremap <leader>fr :vertical resize 30<CR>
 "nnoremap <leader>wr :vertical resize 90<CR>
 "nnoremap <leader>+ :vertical resize +5<CR>
 "nnoremap <leader>- :vertical resize -5<CR>
 "nnoremap <leader>h :wincmd h<CR>
 "nnoremap <leader>l :wincmd l<CR>
 "nnoremap <leader>j :wincmd j<CR>
 "nnoremap <leader>k :wincmd k<CR>
 "nnoremap <leader>q :q!<CR>
 "
 "augroup ProjectDrawer
 "  autocmd!
 "  autocmd VimEnter * :25Lexplore
 "augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"VERSION 2

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

function! OpenToRight()
	:normal v
	let g:path=expand('%:p')
	execute 'q!'
	execute 'belowright vnew' g:path
	:normal <C-w>l
endfunction

function! OpenBelow()
	:normal v
	let g:path=expand('%:p')
	execute 'q!'
	execute 'belowright new' g:path
	:normal <C-w>l
endfunction

function! OpenTab()
	:normal v
	let g:path=expand('%:p')
	execute 'q!'
	execute 'tabedit' g:path
	:normal <C-w>l
endfunction

function! NetrwMappings()
		" Hack fix to make ctrl-l work properly
		noremap <buffer> <A-l> <C-w>l
		noremap <buffer> <C-l> <C-w>l
		noremap <silent> <leader><tab> :call ToggleNetrw()<CR>
		noremap <buffer> V :call OpenToRight()<cr>
		noremap <buffer> H :call OpenBelow()<cr>
		noremap <buffer> T :call OpenTab()<cr>
endfunction

augroup netrw_mappings
		autocmd!
		autocmd filetype netrw call NetrwMappings()
augroup END

" Allow for netrw to be toggled

function! ToggleNetrw()
		if g:NetrwIsOpen
				let i = bufnr("$")
				while (i >= 1)
						if (getbufvar(i, "&filetype") == "netrw")
								silent exe "bwipeout " . i
						endif
						let i-=1
				endwhile
				let g:NetrwIsOpen=0
		else
				let g:NetrwIsOpen=1
				silent Lexplore
		endif
endfunction

" Close Netrw if it's the only buffer open

autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

" Check before opening buffer on any file

function! NetrwOnBufferOpen()
    if exists('b:noNetrw')
        return
    endif
    call ToggleNetrw()
endfun

" Make netrw act like a project Draw

augroup ProjectDrawer
    autocmd!
    " Don't open Netrw
    autocmd VimEnter *.md,*.txt,*.h,*.conf,*.sh,*.vim,\.* let b:noNetrw=1
    autocmd VimEnter * :call NetrwOnBufferOpen()
augroup END

let g:NetrwIsOpen=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Status Bar

"function! GitBranch()
"    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction
"
"function! StatuslineGit()
"    let l:branchname = GitBranch()
"    return strlen(l:branchname) >0?' '.l:branchname.' ':''
"endfunction
set laststatus=2
set statusline=
"set statusline+=%{StatuslineGit()}
set statusline+=\ %.33F
set statusline+=\ -
set statusline+=\ FileType:
set statusline+=%y
set statusline+=%=
set statusline+=\ [%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ ——
set statusline+=%l
set statusline+=\|
set statusline+=%c
set statusline+=\ %L

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"trimwhitespace

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin

call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim' , { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'luochen1990/rainbow'
"Plug 'plasticboy/vim-markdown'
"Plug 'gruvbox-community/gruvbox'
"Plug 'artur-shaik/vim-javacomplete2'
"Plug 'ycm-core/YouCompleteMe'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"IndentLine

let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Markdown-preview settings

let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/o/.local/lib/github-mkdp_markdown_css/github-markdown.css'
let g:mkdp_browser = '/home/o/surf/surf'
nmap <leader>mp <Plug>MarkdownPreview
nmap <leader>ms <Plug>MarkdownPreviewStop

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Markdown Title settings

#!vim
function! MDTitleInsert()
call setline(1,'<meta name="viewport" content="width=device-width, initial-scale=1">')
call append(1,'<link rel="stylesheet" href="github-markdown.css">')
call append(2,'<style>')
call append(3,'	.markdown-body {')
call append(4,'		box-sizing: border-box;')
call append(2,'		min-width: 200px;')
call append(6,'		max-width: 980px;')
call append(7,'		margin: 0 auto;')
call append(8,'		padding: 45px;')
call append(9,'	}')
call append(10,'')
call append(11,'	@media (max-width: 767px) {')
call append(12,'		.markdown-body {')
call append(13,'			padding: 15px;')
call append(14,'		}')
call append(15,'	}')
call append(16,'</style>')
call append(17,'<article class="markdown-body">')
call append(18,'	<h1>Unicorns</h1>')
call append(19,'	<p>All the things</p>')
call append(20,'</article>')
call append(21,'')
call append(22,"Date: " . strftime("%Y-%m-%d %H:%M:%S")  )
call append(23,'')
call append(24,"Last modified: " . strftime("%Y-%m-%d %H:%M:%S")  )
call append(25,'')
endfunction
function! DateInsert()
call cursor(7,1)
if search('Last modified') != 0
    let line = line('.')
    call setline(line,"Last modified: " . strftime("%Y-%m-%d %H:%M:%S"))
endif
endfunction

:map <F2> :call MDTitleInsert()<CR>ggjjA
:autocmd FileWritePre,BufWritePre *.md ks|call DateInsert()|'s

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"C++ title settings

#!vim
function! CPPTitleInsert()
call setline(1,'#include <iostream>')
call append(1,'#include <cstdio>')
call append(2,'#include <cstdlib>')
call append(3,'#include <queue>')
call append(4,'#include <stack>')
call append(5,'#include <algorithm>')
call append(6,'#include <string>')
call append(7,'#include <map>')
call append(8,'#include <set>')
call append(9,'#include <vector>')
call append(10,'#include <cstring>')
call append(11,'using namespace std;')
call append(12,'')
call append(13,"Date: " . strftime("%Y-%m-%d %H:%M:%S")  )
call append(14,'')
call append(15,"Last modified: " . strftime("%Y-%m-%d %H:%M:%S")  )
call append(16,'')
endfunction
function! DateInsert()
call cursor(7,1)
if search('Last modified') != 0
    let line = line('.')
    call setline(line,"Last modified: " . strftime("%Y-%m-%d %H:%M:%S"))
endif
endfunction

:map <F3> :call CPPTitleInsert()<CR>ggjjA
:autocmd FileWritePre,BufWritePre *.cpp ks|call DateInsert()|'s

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings Graveyard
