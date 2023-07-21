let g:local_config_dir_path='~/.vim/config'
let g:local_plugin_path='~/.vim/plugged'
let g:local_global_file='~/.vim/global.vim'

if has('nvim')
    let g:local_init_file='~/.config/nvim/init.vim'
else
    let g:local_init_file='~/.vimrc'
endif

call plug#begin(g:local_plugin_path)
call plug#end()

execute 'source' g:local_global_file

for file in split(glob(g:local_config_dir_path . '/*.vim'))
    execute 'source' file
endfor

function EditConfig(...)
    if len(a:000) == 0
        execute 'edit' g:local_global_file
    else
        let l:args=split(a:000[0],' ')
        if len(l:args) == 1
            let l:file_name = l:args[0]
            execute 'edit' g:local_config_dir_path . '/' . l:file_name . '.vim'
        else
            echo '参数错误'
        endif
    endif
endfunction


command! -nargs=? CE :call EditConfig(<f-args>)
command! -nargs=0 Init :execute 'edit' g:local_init_file
