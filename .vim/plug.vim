call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-autoformat/vim-autoformat'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'pangloss/vim-javascript'
Plug 'morhetz/gruvbox'
" Plug 'rust-lang/rust.vim'
call plug#end()


