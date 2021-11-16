"Neovim init.vim file
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
set wildmenu
set showcmd
syntax on
filetype plugin indent on

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

"move visual selected
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
nnoremap <leader>ft :Lexplore<CR>
nnoremap <leader>fr :vertical resize 30<CR>
nnoremap <leader>wr :vertical resize 90<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :q!<CR>
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_list_hide= '^\..*,.*\.swp$,\~$,\.orig$'
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

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
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
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

call plug#begin('~/.vim/plugged')
Plug 'beeender/Comrade'
Plug 'nvim-treesitter/nvim-treesitter',{'do': ':TSUpdate'}
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'gruvbox-community/gruvbox'
"Plug 'artur-shaik/vim-javacomplete2'
"Plug 'ycm-core/YouCompleteMe'
call plug#end()

"YCM自动关闭预览窗口
"let g:ycm_autoclose_preview_window_after_insertion = 1

"JAVACOMPLETE
"nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"nmap <F5> <Plug>(JavaComplete-Imports-Add)
"imap <F5> <Plug>(JavaComplete-Imports-Add)
"nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

"gruvbox
colorscheme gruvbox
set background=dark
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight CursorLine term=bold cterm=bold ctermbg=NONE
highlight CursorColumn term=bold cterm=bold ctermbg=NONE
let g:gruvbox_transparent_bg=1

"autocmd
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

"augroup Java
"    autocmd!
"    autocmd FileType java setlocal omnifunc=javacomplete#Complete
"augroup END

" 设置vim的内部编码，在neovim上不需要，因为coc.nvim使用了一些
" autoload / float.vim文件中的unicode字符
set encoding=utf-8
" 如果未设置“隐藏”，则TextEdit可能会失败。
set hidden
" 某些服务器的备份文件有问题，请参阅＃649。
set nobackup
set nowritebackup
" 留出更多空间来显示消息。
set cmdheight=2
" 较长的更新时间（默认值为4000 ms = 4 s）会导致明显的
" 延迟和糟糕的用户体验。
set updatetime=300
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
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

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

"IndentLine
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

"RAINBOW
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

"nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
