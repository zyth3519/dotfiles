let g:local_config_dir_path='~/.vim/config'
let g:local_plugin_path='~/.vim/plugged'
let g:local_global_file='~/.vim/global.vim'

if has('nvim')
    let g:local_init_file='~/.config/nvim/init.vim'
else
    let g:local_init_file='~/.vimrc'
endif

" 判断当前是不是wsl环境
if has("unix")
  let lines = readfile("/proc/version")
  if stridx(lines[0], "microsoft") != -1
	  let g:wsl=1
  else
	  let g:wsl=0
  endif
else
	  let g:wsl=0
endif

call plug#begin(g:local_plugin_path)
call plug#end()

execute 'source' g:local_global_file

" 加载所有配置
for file in split(glob(g:local_config_dir_path . '/*.vim'))
    execute 'source' file
endfor
