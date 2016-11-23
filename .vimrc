set nocompatible shiftwidth=2 tabstop=2 smarttab
set hidden cursorline wildmenu wildignore+=*.o title
set lazyredraw t_ti= t_te= path+=**
set list lcs=tab:\|\ 

execute pathogen#infect()
syntax on
filetype plugin indent on

if &term =~ "vt220"
	set t_Co=8
	set t_Sf=[3%dm
	set t_Sb=[4%dm
	colorscheme qnoctu8
else
	colorscheme qnoctu
endif

set tags=./tags
nnoremap <leader>m :Make<cr>
