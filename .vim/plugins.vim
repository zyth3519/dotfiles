if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml('~/.vim/dein.toml')

  " call dein#add('neoclide/coc.nvim', {'hook_add':'source ~/.vim/plugins/coc.vim', 'merge':0, 'rev':'release'})
  call dein#end()
  call dein#save_state()
endif
syntax on
