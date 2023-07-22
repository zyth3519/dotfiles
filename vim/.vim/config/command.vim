" 编辑配置文件命令
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

" 关闭文件
function CloseOtherBuffers() 
	let l:buffers = getbufinfo({'buflisted':1})
	for l:i in buffers
		" 判断是否是当前缓冲区, 不是当前缓冲区进入下一步 
		let l:currnet_buffer = bufnr()
        if l:i.bufnr != l:currnet_buffer

			" 判断是否是终端, 不是终端删除缓冲区
			if stridx(i.name, 'term') != 0
				:exe 'bd ' . i.bufnr 
			endif
		endif
    endfor
endfunction

" buffer操作
" 关闭当前buffer
command! -nargs=0 Close :bp|bd#
command! -nargs=0 CloseOther :call CloseOtherBuffers()
