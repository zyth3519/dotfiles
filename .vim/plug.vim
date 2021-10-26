call plug#begin('~/.vim/plugged')
" 代码补全
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" 代码格式化
Plug 'vim-autoformat/vim-autoformat'
" 模糊查找
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" 注释
Plug 'preservim/nerdcommenter'
" 美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
" js支持
Plug 'pangloss/vim-javascript'
" 括号补全
Plug 'jiangmiao/auto-pairs'
" html内嵌css js 格式
Plug 'othree/html5.vim'
" 常用代码段
Plug 'honza/vim-snippets'
" ranger文件管理器
Plug 'kevinhwang91/rnvimr'
" 内置终端增强
Plug 'skywind3000/vim-terminal-help'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate','branch':'0.5-compat'}  " We recommend updating the parsers on update
Plug 'p00f/nvim-ts-rainbow'
Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
call plug#end()
