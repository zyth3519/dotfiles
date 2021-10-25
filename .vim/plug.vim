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
call plug#end()
