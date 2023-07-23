let g:defx_icons_enable_syntax_highlight = 1

" 开关快捷键,【-search=`expand('%:p')`】表示打开defx树后，光标自动放在当前buffer上
nmap <silent> <leader>f :Defx  -search=`expand('%:p')` -toggle <cr>

"打开vim自动打开defx
func! ArgFunc() abort
	let s:arg = argv(0)
	if isdirectory(s:arg)
		return s:arg
	else
		return fnamemodify(s:arg, ':h')
	endif
endfunc

autocmd VimEnter * Defx `ArgFunc()` -no-focus -search=`expand('%:p')`

" 设置defx树的一些格式
call defx#custom#option('_', {
	  \ 'columns': 'icons:indent:filename:size',
	  \ 'winwidth': 25,
	  \ 'split': 'vertical',
	  \ 'direction': 'topleft',
	  \ 'show_ignored_files': 0,
	  \ 'resume': 1,
	  \ })

" Exit Vim if defxTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:defx') |
\ quit | endif

" 在打开多个tab的情况下，当前tab里只有一个buffer和nerd树，当关闭buffer时，自动关闭当前标签页的nerd树
autocmd BufEnter * if tabpagenr('$') > 1 && winnr('$') == 1 && exists('b:defx') |
\ tabclose | endif

" 所有快捷键在这里设置
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>     
				\ defx#is_directory() ? 
				\ defx#is_opened_tree() ? 
					\ defx#do_action('close_tree', defx#get_candidate().action__path) : 
					\ defx#do_action('open_tree')
				\ : defx#do_action('drop')

	nnoremap <silent><buffer><expr> yy       defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> dd       defx#do_action('remove')
	nnoremap <silent><buffer><expr> cc        defx#do_action('copy')
	nnoremap <silent><buffer><expr> mm        defx#do_action('move')
	nnoremap <silent><buffer><expr> pp        defx#do_action('paste')
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
	nnoremap <silent><buffer><expr> u        defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> q        defx#do_action('quit')
	nnoremap <silent><buffer><expr> <        defx#do_action('resize',  defx#get_context().winwidth - 10)
	nnoremap <silent><buffer><expr> >        defx#do_action('resize',  defx#get_context().winwidth + 10)
	nnoremap <silent><buffer><expr> .        defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> r        defx#do_action('redraw')
	nnoremap <silent><buffer><expr> s        defx#do_action('toggle_columns',  'mark:indent:icon:filename:type:size:time')
	nnoremap <silent><buffer><expr> E        defx#do_action('open', 'vsplit')
nnoremap <silent><buffer><expr> <2-LeftMouse>
endfunction
