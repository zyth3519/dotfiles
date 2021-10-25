" 设置前缀键
let mapleader="\<space>"

source ~/.vim/plug.vim
source ~/.vim/config.vim
source ~/.vim/mapping.vim
source ~/.vim/user.vim

if $TERM == "xterm-256color"
	set t_Co=256
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4

filetype plugin on

autocmd FileType css setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 为消息显示提供空间
set cmdheight=2

set number
