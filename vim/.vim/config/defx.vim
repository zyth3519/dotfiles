let g:defx_icons_enable_syntax_highlight = 1
" 开关快捷键,【-search=`expand('%:p')`】表示打开defx树后，光标自动放在当前buffer上
nmap <silent> ff :Defx  -search=`expand('%:p')` -toggle <cr>


"打开vim自动打开defx
func! ArgFunc() abort
	let s:arg = argv(0)
	if isdirectory(s:arg)
		return s:arg
	else
		return fnamemodify(s:arg, ':h')
	endif
endfunc
"autocmd VimEnter * Defx `ArgFunc()` -no-focus -search=`expand('%:p')`

" 设置defx树的一些格式
call defx#custom#option('_', {
	  \ 'columns': 'icons:indent:filename:size',
	  \ 'winwidth': 30,
	  \ 'split': 'vertical',
	  \ 'direction': 'botright',
	  \ 'show_ignored_files': 0,
	  \ 'resume': 1,
	  \ })

" Exit Vim if defxTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:defx') |
\ quit | endif

" 在打开多个tab的情况下，当前tab里只有一个buffer和nerd树，当关闭buffer时，自动关闭当前标签页的nerd树
autocmd BufEnter * if tabpagenr('$') > 1 && winnr('$') == 1 && exists('b:defx') |
\ tabclose | endif

" 在新tab页打开文件
func! MyT(context) abort
	if isdirectory(get(a:context.targets, 0)) == 0
		call defx#call_action('drop', 'tabe')
	endif
endfunc


" 给cd快捷键写的
func! MyCD(context) abort
	if isdirectory(get(a:context.targets, 0))
		execute 'cd' . get(a:context.targets, 0)
	else
		execute 'cd' . fnamemodify(defx#get_candidate().action__path, ':h')
	endif
endfunc

" 给 ter 快捷键写的
func! MyTER(context) abort
	call MyCD(a:context)
	shell
endfunc

" 给复制或剪切选中的文件或目录写的
func! Mycopy_cut(mode) abort
	let s:Path = defx#get_selected_candidates()
	let s:Len = len(s:Path)
	let s:Path_list = []
	let s:counter = 0
	while s:counter < s:Len
		let s:P = s:Path[s:counter].action__path
		call add(s:Path_list, s:P)
		let s:counter = s:counter + 1
	endwhile
	let s:MyCMD = ['!~/.vim/cut_copy.py'] + s:Path_list + [a:mode]
	execute join(s:MyCMD)
	endfunc

" 给粘贴文件写的
func! Mypaste() abort
	execute join(['!~/.vim/paste.py', defx#get_candidate().action__path])
endfunc

" 所有快捷键在这里设置
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>     
				\ defx#is_directory() ? 
				\ defx#is_opened_tree() ? 
					\ defx#do_action('close_tree', defx#get_candidate().action__path) : 
					\ defx#do_action('open_tree')
				\ : defx#do_action('drop')

	nnoremap <silent><buffer><expr> t        defx#do_action('call', 'MyT')
	nnoremap <silent><buffer><expr> yy       defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> dd       defx#do_action('remove_trash')
	nnoremap <silent><buffer><expr> cc        defx#do_action('copy')
	nnoremap <silent><buffer><expr> mm        defx#do_action('move')
	nnoremap <silent><buffer><expr> pp        defx#do_action('paste')
	nnoremap <silent><buffer><expr> CC       Mycopy_cut('copy') . defx#do_action('clear_select_all')
	nnoremap <silent><buffer><expr> MM       Mycopy_cut('cut') . defx#do_action('clear_select_all')
	nnoremap <silent><buffer><expr> PP       Mypaste()
	nnoremap <silent><buffer><expr> N        defx#do_action('new_file')
	nnoremap <silent><buffer><expr> M        defx#do_action('new_multiple_files')
	nnoremap <silent><buffer><expr> R        defx#do_action('rename')
	nnoremap <silent><buffer><expr> j        line('.') == line('$') ? 'gg' : 'j'
	nnoremap <silent><buffer><expr> k        line('.') == 1 ? 'G' : 'k'
	nnoremap <silent><buffer><expr> h    
				\ defx#is_opened_tree() ? 
				\ defx#do_action('close_tree', defx#get_candidate().action__path) : 
				\ defx#do_action('search',  fnamemodify(defx#get_candidate().action__path, ':h'))
	nnoremap <silent><buffer><expr> l        defx#do_action('open_tree')
	nnoremap <silent><buffer><expr> o        defx#do_action('open_directory')
	nnoremap <silent><buffer><expr> u        defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> E        defx#do_action('open', 'vsplit')
	nnoremap <silent><buffer><expr> P        defx#do_action('preview')
	"nnoremap <silent><buffer><expr> d        defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> C        defx#do_action('toggle_columns',  'mark:indent:icon:filename:type:size:time')
	nnoremap <silent><buffer><expr> S        defx#do_action('toggle_sort', 'time')
	nnoremap <silent><buffer><expr> !        defx#do_action('execute_command')
	nnoremap <silent><buffer><expr> x        defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> cd       defx#do_action('call', 'MyCD')
	nnoremap <silent><buffer><expr> ~        defx#do_action('cd')
	nnoremap <silent><buffer><expr> ter      defx#do_action('call', 'MyTER')
	nnoremap <silent><buffer><expr> .        defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> q        defx#do_action('quit')
	nnoremap <silent><buffer><expr> <Space>  defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> *        defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> m        defx#do_action('clear_select_all')
	nnoremap <silent><buffer><expr> r        defx#do_action('redraw')
	nnoremap <silent><buffer><expr> pr       defx#do_action('print')
	nnoremap <silent><buffer><expr> >        defx#do_action('resize',  defx#get_context().winwidth - 10)
	nnoremap <silent><buffer><expr> <        defx#do_action('resize',  defx#get_context().winwidth + 10)
nnoremap <silent><buffer><expr> <2-LeftMouse>
endfunction
