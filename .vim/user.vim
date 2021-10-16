fun! start_server()
	let job = job_start("live-server --no-browser --host=0.0.0.0 --port=8000")
endfunc

command Sstart call start_server()
