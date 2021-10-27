let g:Lf_ShortcutF = '<C-P>'

" 格式化文档
noremap <M-C-L> :Autoformat<CR>

" 打开文件树
nnoremap <leader>n :NERDTreeFocus<CR>:wincmd p<CR>

" 调整窗口大小
nnoremap  <
nnoremap  >

" 切换窗口
nnoremap <leader>j j
nnoremap <leader>k k
nnoremap <leader>h h
nnoremap <leader>l l

" ctrl+/ 注释
nmap <C-_> :call nerdcommenter#Comment("n","Invert") <CR>
vmap <C-_> :call nerdcommenter#Comment("n","Invert") <CR>
imap <C-_>  :call nerdcommenter#Comment("n","Invert") <CR>i

" LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>
"" ===============================coc-nvim=================================
" 输入ctrl+enter 键入第一个和选择选项
inoremap <silent><expr>  pumvisible() ? coc#_select_confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\"

" TAB补全
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 按ctrl+space强制开启补全菜单
inoremap <silent><expr> <c-space> coc#refresh()

" 导航诊断
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 使用K打开文档
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" 重构
" 重命名
nmap <leader>rn <Plug>(coc-rename)
" 新开窗口修改
nmap <leader>rf <Plug>(coc-refactor)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" 多光标支持
nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-d> <Plug>(coc-cursors-word)
xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
