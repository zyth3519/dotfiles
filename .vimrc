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

" 设置行号，可以同时启用相对行号和绝对行号，使用的是混合行号，当前行显示绝对行号，其他行显示相对行号
" 绝对行号
set number
" 相对行号
set relativenumber
syntax on
