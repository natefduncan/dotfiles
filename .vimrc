" Encoding
set encoding=utf-8

" Plugins
call plug#begin()

" Theme
" Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', {'branch': '5bec08d', 'rtp': 'vim/'}

" Rust
Plug 'rust-lang/rust.vim'

" Coc
Plug 'neoclide/coc.nvim', {'branch' : 'release'}

" Vinegar
" Enhancements to netrw to avoid need for project drawer
Plug 'tpope/vim-vinegar'

" Fuzzy search
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

" Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" R
Plug 'jalvesaq/Nvim-R', {'branch' : 'stable'}

"Python code folding
Plug 'tmhedberg/SimpylFold'

"Make all text center
Plug 'junegunn/goyo.vim'

" Markdown preview
Plug 'iamcco/markdown-preview.vim'

" Markdown tools
Plug 'SidOfc/mkdx'

" Fix Vim clipboard problem
Plug 'christoomey/vim-system-copy'

" Surround
Plug 'https://github.com/tpope/vim-surround.git'
" ysiw" surrounds one word with the " sign
" yss) surrounds entire line with )
" yss<p> surrounds line with the <p> tag and auto completes the closing tag
" to surround multiple lines with a tag like a <li></li> use visual
" selection
" then press St and type the tag. Notice that the first < is already written 
" so dont type it twice otherwise you'll get <<li>

" Menu to help learning leader keybindings
Plug 'liuchengxu/vim-which-key'
"press <leader>h to activate

" Bottom status tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

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

" Clipboard
set clipboard=unnamedplus
" Using the clipboard plugin c-p can be used to copy to system clipboard
" and c-v to paste from system clipboard(works in visual mode) - xsel is a
" dependency
" For modern terminals such as konsole-xfce-mate etc... Ctrl Shift V works as
" usual

" The default mapping is cp for copying and cv for pasting, and can be
" followed by any motion or text object. For instance:
" cpiw => copy word into system clipboard
" cpi' => copy inside single quotes to system clipboard
" cvi' => paste inside single quotes from system clipboard
" In addition, cP is mapped to copy the current line directly.
" The sequence cV is mapped to paste the content of system clipboard to the
" next line.

" Jump to last position when opening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" General Settings
" Set paste toggle
set pastetoggle=<F3>

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

" Package Specific Settings
" Rust
" syntax enable

" NerdCommenter
let g:NERDSpaceDelims = 1

" Theme
syntax on
set t_Co=256
set cursorline
colorscheme onehalflight
let g:airline_theme='onehalfdark'

" Custom Mappings 
let mapleader = " "
nnoremap <C-p> :Files <CR>
nnoremap <C-f> :Ag <CR>
map <leader>f :Goyo <CR>
map <leader>h :WhichKey '<Space>'<CR>
inoremap jj <esc>
nmap <leader>w :w!<CR>
map <F6> :setlocal spell! spelllang=en_us<CR>
nmap <silent> <F8> <Plug>MarkdownPreview
imap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview
imap <silent> <F9> <Plug>StopMarkdownPreview
