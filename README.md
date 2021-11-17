# Vim
配置文件
https://www.reddit.com/r/vim/comments/gbfy8u/set_vim_theme_but_also_keeping_the_terminal/
gg=G indent everything


While moving the cursor across a vim process open in a tmux session, every now and then, why does it leave a trail of ghost characters - ^[OB, ^[OA?


https://stackoverflow.com/questions/6987317/while-moving-the-cursor-across-a-vim-process-open-in-a-tmux-session-every-now-a


UPDATE: I figured out the cause. I had added to functions that automatically updated the cwd name and the current git branch in my vim statusline. This caused vim to be laggy and everytime it lagged on a up/down/left/right key hit, it printed out the ghost characters ^[OA, etc. It's possible that stuff got complicated because I was using vim in tmux, but I saw the ghost characters outside tmux also. So, probably not. I've turned off those two functions in my .vimrc and my vim statusline is presently less awesome than it used to be :( Wish there's a way out.

#Java Compiler Setting with makeprg in .vim/compiler/javac.vim(make it up)

"Avoid loading twice from autocommands
if exists("current_compiler")
    finish
endif
let current_compiler = "javac"

"Fallback compiler setlocal
if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet
if search('^\s*package\s\+.*;$', 'pw') > 0
    set makeprg=javac\ -g\ -cp\ \"lib/*\"\ -d\ bin\ $(find\ src\ -name\ \"*.java\")
else
    set makeprg=javac\ -g\ -d\ .\ %
endif

CompilerSet errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
  
#ftplugin in .vim/after/ftplugin/java.vim (make it up)

compiler javac
noremap <buffer> <leader>m :w<CR>:make<CR>:cwindow<CR>
noremap <buffer> <leader>r :!clear;echo <C-r>=expand('%:t:r')<CR> \| xargs java<CR>
