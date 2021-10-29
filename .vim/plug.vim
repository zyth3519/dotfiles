call plug#begin('~/.vim/plugged')
" 代码补全
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" 模糊查找
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" 注释
Plug 'preservim/nerdcommenter'
" js支持
Plug 'pangloss/vim-javascript'
" 括号补全
Plug 'jiangmiao/auto-pairs'
" html内连js 格式
Plug 'othree/html5.vim'
" 常用代码段
Plug 'honza/vim-snippets'
" 内置终端增强
Plug 'skywind3000/vim-terminal-help'

" 美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" 代码高亮
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate','branch':'0.5-compat'}  " We recommend updating the parsers on update
" 彩虹括号
Plug 'p00f/nvim-ts-rainbow'
Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" git
Plug 'kdheepak/lazygit.nvim'

" 浮动终端
Plug 'voldikss/vim-floaterm'
" vim输入法
Plug 'lilydjwg/fcitx.vim'

" 文件树
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'

call plug#end()
