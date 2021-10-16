" 为消息显示提供空间
set cmdheight=2
" 设置前缀键
let mapleader="\<space>"

set number

source ~/.vim/plug.vim
source ~/.vim/config.vim
source ~/.vim/mapping.vim
" source ~/.vim/user.vim

autocmd FileType css setlocal formatoptions-=c formatoptions-=r formatoptions-=o

if $TERM == "xterm-256color"
  set t_Co=256
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4

filetype plugin on
