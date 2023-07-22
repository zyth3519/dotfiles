" 设置颜色
if has('nvim')
	" Or if you have Neovim >= 0.1.5
	if (has("termguicolors"))
	 set termguicolors
	endif

	" Theme
	syntax enable
	colorscheme OceanicNext
else
	" Theme
	 syntax enable

	" for vim 8
	 if (has("termguicolors"))
	  set termguicolors
	 endif
	colorscheme OceanicNext

endif
