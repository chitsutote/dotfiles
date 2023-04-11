"make it incompatible with vi
set	nocompatible

"file type detetion off
filetype	off

"Vundle Setting
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Check if vundle not exist then install
" :PluginInstall
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo	"Installing Vundle..."
	echo	""
	silent	!mkdir	-p	~/.vim/bundle
	silent	!git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	let	iCanHazVundle=0
endif

"Brief Help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles

"Use Vundle manage Vundle itself
Bundle	'gmarik/vundle'

"Use The Nerd Tree
Bundle 'The-NERD-tree'

"Use Vim Surround
Bundle 'tpope/vim-surround'

"Use Vim repeat
Bundle 'tpope/vim-repeat'

"General Setting


set t_Co=256

syntax on 

set tabstop=2	"Set tab width

set hlsearch	"set highlight search
set incsearch	"show result while typing searching keyword
set ignorecase	"set search ingnore cases

" cursor postion
set cursorline
set ruler
set	nu rnu	"set Hybrid line number


" set auto command to toggle between absolute line number and relative line number while switching insert mode and normal mode
" using absolute line number in insert mode
" using hybrid line number in normal mode
" how to disable it: :autocmd! numbertoggle
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set rnu
	autocmd BufLeave,FocusGained,InsertEnter * set nornu
augroup END

set	autoindent  

"----- hotkey config -----

"Switch split window hotkey

"Switch to below
map	<c-j>	<c-w>j

"Switch to above
map	<c-k>	<c-w>k

"Switch to left
map	<c-h>	<c-w>h

"Switch to right
map	<c-l>	<c-w>l

"Map F5 -> NERDTree
nnoremap <silent> <F5> :NERDTree<CR>
" Map F2 -> toggle line number
nnoremap <silent> <F2> :set nu! <bar> :set rnu!<CR>

" auto complete ()
nnoremap ( ()<Esc>i

" auto complete []
inoremap [ []<Esc>i

" auto complete {}
inoremap { {}<Esc>i

" auto complete ''
inoremap ' ''<Esc>i

" auto complete \"\"
inoremap " ""<Esc>i

" remap key for colemak layout
"noremap j n
"noremap k e
"noremap l i
"noremap e j
"noremap n k
"noremap i l
