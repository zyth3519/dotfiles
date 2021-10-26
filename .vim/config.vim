" airline配置
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" vim-javascript
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

"===============Ranger===================
" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" 保存文件后自动格式化代码
au BufWrite * :Autoformat

"=====================注释==========================
"" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

let g:rainbow_active = 1
