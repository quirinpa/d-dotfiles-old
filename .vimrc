" auto install vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
	silent ! curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

syntax on

set nocompatible shiftwidth=2 tabstop=2 smarttab
set hidden number cursorline wildmenu wildignore+=*.o title
set lazyredraw t_ti= t_te= path+=**
filetype plugin indent on
set list lcs=tab:\|\ 
" email format=flowed
" setlocal fo+=aw

call plug#begin()
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'exvim/ex-cref'
if substitute(system('hostname'), '\n', '', '') == "qbit"
	Plug 'xolox/vim-easytags'
	set tags=./tags
	let g:easytags_async=1
	let g:easytags_dynamic_files=1
	Plug 'majutsushi/tagbar'
	nmap <leader>t :TagbarToggle<cr>
endif
call plug#end()

try
	colorscheme qnoctu
catch
endtry

nnoremap <leader>m :Make<cr>

function! MakeTex()
	w
	let fname = expand("%:t:r")
	let result = system("pdflatex " . expand("%") . " && mupdf " . fname . ".pdf")
	execute system("rm " . fname . ".aux " . fname . ".log")
	echo result
endfunction

set list lcs=tab:\|\ 

au BufWrite *.html execute "silent !$HOME/.vim/reload_browser.sh %"
