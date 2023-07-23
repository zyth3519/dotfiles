" 安装插件
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coc-nvim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yianwillis/vimcdoc'
Plug 'mhartington/oceanic-next'
Plug 'skywind3000/vim-terminal-help'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } "defx.vim
else
  Plug 'Shougo/defx.nvim' "defx.nvim
  Plug 'roxma/nvim-yarp' "defx.nvim
  Plug 'roxma/vim-hug-neovim-rpc' "defx.nvim
endif 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

if g:wsl
	set clipboard+=unnamedplus

	let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }
endif

" 设置前缀键
let mapleader="\<space>"

" 缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 为消息显示提供空间
set cmdheight=2

" 设置行号，可以同时启用相对行号和绝对行号，使用的是混合行号，当前行显示绝对行号，其他行显示相对行号
" 绝对行号
set number
" 相对行号
set relativenumber

" 窗口操作
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-l> <C-w>l



