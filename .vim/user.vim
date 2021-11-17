"=====================vim中打开文件服务器,常用于预览html==================
let g:live_server_status = "none"
" 默认浏览器
" let g:open_browse = 'google-chrome-stable'
let g:open_browse = "firefox"
" 服务器端口
let g:live_server_port = 8000
" 服务器开启时是否打开网页，0 打开 1  不打开
let g:live_server_flag = 0

let g:file_folder = v:null

fun! OpenBrowse()
	" 浏览器打开路径
	let g:open_browse_cmd = g:open_browse . " http://127.0.0.1:" . g:live_server_port . "/"  . expand('%:t')

	" 判断服务器是否运行
	if g:live_server_status == "run"
		" 当前服务器所处文件加与文件所在文件夹不一致，重新启动服务器
		if g:file_folder != expand("%:p:h")
			call Sstop()
			" 服务器打开文件夹，不设置默认为null
			let g:file_folder = expand("%:p:h")
			" 是否打开浏览器的标记，重新启动服务器，要将此值重置
			let g:live_server_flag = 0
			call SStart()

		elseif g:file_folder == expand("%:p:h") " 当前服务器所处文件加与文件所在文件夹一致，打开浏览器
			call jobstart(g:open_browse_cmd)
		endif

		" 服务器未在运行，设置服务器打开文件夹，并启动服务器
	elseif g:live_server_status == "none"
		let g:file_folder = expand("%:p:h")
		call Sstart()
	endif

endfunc

" 回调函数服务器启动打开浏览器
fun! Live_Server_Handler(job_id,data, event)

	let g:live_server_status = "run"

	if g:live_server_flag == 0
		call jobstart(g:open_browse_cmd)
		let g:live_server_flag = 1
	endif

endfunc

fun! Sstop()
	call jobstop(g:live_server)
endfunc

" 启动服务器
fun! Sstart()

	" 服务器启动命令
	let cmd = "live-server --no-browser --port=" . g:live_server_port . " '" . g:file_folder . "'"

	let g:live_server = jobstart(cmd,{"on_stdout":"Live_Server_Handler"})

endfunc

command! OpenBrowse call OpenBrowse()
command! Sstop call Sstop()
"===================================nvim终端=========================================
function! TerminalQuit()
	let bid = get(t:, '__terminal_bid__', -1)
	if bid < 0
		return
	endif
	let name = bufname(bid)
	if name == ''
		return
	endif
	exec "bw! ". name
endfunc

au TermClose * call TerminalQuit()
