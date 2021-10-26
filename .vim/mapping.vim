" 切换注释
nnoremap <silent>  :call nerdcommenter#Comment("x", "Toggle")<CR>

" 查找文件
let g:Lf_ShortcutF = '<C-P>'

" 格式化文档
map  :Autoformat<cr>

" 打开文件树
nnoremap <leader>n <Cmd>CocCommand explorer<CR>

"===============================coc-nvim=================================
" 输入ctrl+enter 键入第一个和选择选项
inoremap <silent><expr>   pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\"

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

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


"========================文件树==========================
autocmd FileType defx call s:defx_mappings()

function! s:defx_mappings() abort
  nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')     " 显示隐藏文件
  nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction
