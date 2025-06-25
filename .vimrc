" ============================================================================d
" Plugin Manager Setup
" =============================================================================
"

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Create a horizontal split at the bottom when installing plugins
let g:plug_window = 'vertical topleft new'

let g:plug_dir = expand('~/.vim/bundle')
call plug#begin(g:plug_dir)
Plug 'nocksock/nazgul-vim'

Plug 'udalov/kotlin-vim'

Plug 'preservim/nerdcommenter'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

call plug#end()   "required

" Snipmate settings
let g:snipMate = { 'snippet_version' : 1 }

let g:dracula_italic = 0

let NERDTreeShowHidden=1

set diffopt+=vertical

"""""""""""""""""""""""
""" GENERAL SETTINGS ""
"""""""""""""""""""""""

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Enable syntax highlighting
syntax on

" Remap leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" Set relative line numbers
" set nu relativenumber

" Set g to default when replacing with :s
:set gdefault

" Change cursor when switching modes
:autocmd InsertEnter,InsertLeave * set cul!

" Easy tab switching
nnoremap H gT
nnoremap L gt

" Find files and buffers with fzf
nnoremap <leader>p :Files<CR>
nnoremap <leader>o :Buffers<CR>
nnoremap <leader>f :Ag<CR>

" Easy buffer switching
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-h> <c-w>h
nnoremap <C-l> <c-w>l

" NERDTree settings
nnoremap <leader>n :NERDTreeToggle %<CR>

" Paste in the end of line mapping
:nmap , $p

" Split everything below
"set splitbelow

" Directory for swap files
set directory=~/.vim/tmp/
set backupdir=~/.vim/tmp/
set undodir=~/.vim/tmp/

" Dynamically move text

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set cursorline

set termguicolors

colorscheme nazgul

