" airline配置
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" html服务器配置
"let g:bracey_browser_command = 1
"let g:bracey_refresh_on_save = 0
"let g:bracey_server_allow_remote_connections = 1
"let g:bracey_server_port = 8000
"let g:bracey_server_path = "http://0.0.0.0"

" vim-javascript
"
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_ngdoc = 1

" 设置VIM 支持 256color
if $TERM == "xterm-256color"
	set t_Co=256
endif

" 设置缩进为4个空格
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 设置vim主题
syntax enable
set background=dark
colorscheme gruvbox

" let g:NERDCreateDefaultMappings = 0

" coc-nvim
set cmdheight=2
set updatetime=50
set shortmess+=c
set signcolumn=number

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
