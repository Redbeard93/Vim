" Neovim init.vim file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Basics

"these three lines are actually needed for true color abled in vim
"set termguicolors
" You should input actual escape for ^[. Use <Ctrl-V><Esc> to input actual escape."
"set t_8f=^[[38;2;%lu;%lu;%lum 
" You should input actual escape for ^[. Use <Ctrl-V><Esc> to input actual escape."
"set t_8b=^[[48;2;%lu;%lu;%lum

" 设定在无操作时，交换文件刷写到磁盘的等待毫秒数（默认为 4000）
set updatetime =100
" 设定等待按键时长的毫秒数
set timeoutlen =500

"是否开启 xterm 兼容的终端 24 位色彩支持
set termguicolors
set path=.,**
set suffixesadd=.java
set exrc
set nocompatible
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

"命令模式补全
set wildmenu

set showcmd

"命令模式搜索命令可以无视大小写区别
set ignorecase


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

highlight Cursor guibg=#9E619E guifg=#619E9E
highlight ModeMsg guibg=NONE guifg=#619E9E
highlight Search guibg=#619E9E guifg=#9E619E
highlight IncSearch guibg=#9E619E guifg=#619E9E
highlight WildMenu guibg=#9E619E guifg=#619E9E

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

nnoremap <leader>t :bo 12new<CR>:terminal<CR>
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

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) >0?' '.l:branchname.' ':''
endfunction

set laststatus=2
set statusline=
set statusline+=\ \ %{StatuslineGit()}
set statusline+=\ \ %.33F
set statusline+=\ \ \ %y
set statusline+=%=
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}\ 
set statusline+=\ %{&fileformat}\\ 
set statusline+=\ 錄%L\ 
set statusline+=\ \ %l\ 
set statusline+=\ \ %c\ 
set statusline+=\ ﴜ\ %p\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"trimwhitespace

"fun! TrimWhitespace()
"    let l:save = winsaveview()
"    keeppatterns %s/\s\+$//e
"    call winrestview(l:save)
"endfun

"augroup Trim
"    autocmd!
"    autocmd BufWritePre * :call TrimWhitespace()
"augroup END

"augroup Java
"    autocmd!
"    autocmd FileType java setlocal omnifunc=javacomplete#Complete
"augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin

call plug#begin('~/.vim/plugged')

Plug 'beeender/Comrade'
Plug 'nvim-treesitter/nvim-treesitter',{'do': ':TSUpdate'}
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Coc

" 设置vim的内部编码，在neovim上不需要，因为coc.nvim使用了一些
" autoload / float.vim文件中的unicode字符
"set encoding=utf-8
" 如果未设置“隐藏”，则TextEdit可能会失败。
"set hidden
" 某些服务器的备份文件有问题，请参阅＃649。
"set nobackup
"set nowritebackup
" 留出更多空间来显示消息。
"set cmdheight=2
" 较长的更新时间（默认值为4000 ms = 4 s）会导致明显的
" 延迟和糟糕的用户体验。
set updatetime=100
" 不要将消息传递到| ins-completion-menu |。
set shortmess+=c

" 始终显示标志列，否则每次都会移动文本
" 诊断出现/已解决。
if has("patch-8.1.1564")
  " 最近vim可以将signcolumn和number列合并为一个
  set signcolumn=number
else
  set signcolumn=yes
endif

" 使用制表符可完成带有前面字符的触发操作并进行导航。
" NOTE: 这个命令':verbose imap <tab>' 去确实你的<tab>键
" 没有被其他插件使用。
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用 <c-space> 触发自动完成。
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" 使<CR>自动选择第一个完成项目，并将coc.nvim通知给
" 输入格式，<cr>可能会被其他vim插件重新映射
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 使用 `[g` and `]g` 浏览诊断
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo代码导航
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 使用 K 在预览窗口中显示文档。
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 按住光标时突出显示该符号及其参考。
autocmd CursorHold * silent call CocActionAsync('highlight')

" 重命名符号。
nmap <leader>rn <Plug>(coc-rename)

" 格式化选定的代码。
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " 更新有关跳转占位符的签名帮助。
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 将codeAction应用于所选区域。
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

function! s:cocActionsOpenSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenSelected<CR>g
nmap <leader>A :CocAction<CR>

" 重新映射用于将codeAction应用于当前缓冲区的键。
nmap <leader>ac  <Plug>(coc-codeaction)
" 将AutoFix应用于当前行的问题。
nmap <leader>qf  <Plug>(coc-fix-current)

" 映射函数和类文本对象
" 注意：需要语言服务器提供'textDocument.documentSymbol'支持。
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" 使用CTRL-S作为选择范围。
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" 添加`:Format`命令格式化当前缓冲区。
command! -nargs=0 Format :call CocAction('format')

" 添加`：Fold`命令来折叠当前缓冲区。
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" 添加（Neo）Vim的本机状态行支持。
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" CoCList的映射
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"IndentLine

let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nvim-treesitter

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
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
call append(5,'		min-width: 200px;')
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
syntax on
" Plugin settings Graveyard
