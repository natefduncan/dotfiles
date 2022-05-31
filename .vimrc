" Turn on line numbers
set number

" Tabs to 4 spaces instead of 8
set tabstop=4
set shiftwidth=0

" Save backup files in ~/.vim/tmp
set backupdir=~/.vim/tmp/,/tmp//
set directory=~/.vim/tmp/,/tmp//
set undodir=~/.vim/tmp/,/tmp//
set backup
set undofile

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

let mapleader = " "

" Vim-plug
" This will install vim-plug if it doesn't exist. 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs),'!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
" Theme
Plug 'NLKNguyen/papercolor-theme'

" Rust
Plug 'rust-lang/rust.vim'

" Coc
Plug 'neoclide/coc.nvim', {'branch' : 'release'}

" Vinegar
" Enhancements to netrw to avoid need for project drawer
Plug 'tpope/vim-vinegar'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Nerd Commenter
Plug 'preservim/nerdcommenter'

" Swapping windows
Plug 'wesQ3/vim-windowswap'
" Usage {{{
"   <leader>ww to select a split, then <leader>ww again in a different split
"   to swap them.
" }}}

" Rename files!
Plug 'danro/rename.vim'
" :rename[!] {newname}

Plug 'christoomey/vim-tmux-navigator'

Plug 'jalvesaq/Nvim-R', {'branch' : 'stable'}

"Python code folder
Plug 'tmhedberg/SimpylFold'

call plug#end()


" Rust
syntax enable

" NerdCommenter
let g:NERDSpaceDelims = 1

" Theme
set t_Co=256
set cursorline
set background=light
colorscheme PaperColor
