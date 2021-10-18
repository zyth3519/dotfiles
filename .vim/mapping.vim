" 打开文件树
nnoremap <leader>p :NERDTreeToggle<CR>

" 输入ctrl+enter 键入第一个和选择选项
inoremap <silent><expr>   pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\"

" 切换注释
nnoremap <silent>  :call nerdcommenter#Comment("x", "Toggle")<CR>

" 查找文件
let g:Lf_ShortcutF = '<C-P>'

" 格式化文档

map  :Autoformat<cr>

" 打开文件树
nnoremap <leader>n :NERDTreeFocus<CR>
