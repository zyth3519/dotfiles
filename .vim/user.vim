let g:live_server_status = "none"
" 默认浏览器
let g:open_browse = "google-chrome-stable"
" 服务器端口
let g:live_server_port = 8000
" 服务器开启时是否打开网页，0 打开 1  不打开
let g:live_server_flag = 0

" 回调函数服务器启动打开浏览器
fun! Live_Server_Handler(channel, msg)

	let g:live_server_status = "run"

	if g:live_server_flag == 0
		call OpenBrowse()
		let g:live_server_flag = 1
		echo "服务器成功启动"
	endif

endfunc

" 启动服务器
fun! Sstart()
	" 检查服务器是否启动
	if g:live_server_status == "run"
		echo "live_server已经启动"
		return
	endif

	let cmd = "live-server --no-browser --port=" . g:live_server_port . " ."
	let g:live_server = job_start(cmd,{"out_cb":"Live_Server_Handler"})
endfunc

fun! OpenBrowse()
	let cmd = g:open_browse . " http://127.0.0.1:" . g:live_server_port . "/"  . expand("%")


	" 服务器启动后打开浏览器
	if g:live_server_status == "run"
		let job = job_start(cmd)
	elseif g:live_server_status == "none" " 若服务器未启动，启动它
		call Sstart()
	endif

endfunc

fun! Sstop()
	if g:live_server_status == "run"
		call job_stop(g:live_server)
		echo "服务器成功停止"
	elseif g:live_server_status == "none" " 若服务器未启动，启动它
		echo "服务器未启动"
	endif
endfunc



command! Sstart call Sstart()
command! Sstop call Sstop()
command! OpenBrowse call OpenBrowse()
