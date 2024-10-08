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

Plug 'ku1ik/vim-monokai'
Plug 'projekt0n/github-nvim-theme'
Plug 'Shatur/neovim-ayu'
Plug 'EdenEast/nightfox.nvim'
Plug 'vim-scripts/proton'
Plug 'doums/darcula'

Plug 'udalov/kotlin-vim'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'FooSoft/vim-argwrap'

" For snippets
Plug 'garbas/vim-snipmate' 
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree'

Plug 'tpope/vim-fugitive'

Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()   "required

" Snipmate settings
let g:snipMate = { 'snippet_version' : 1 }

let g:dracula_italic = 0 

let NERDTreeShowHidden=1

set diffopt+=vertical

:imap <C-j> <Plug>snipMateNextOrTrigger
:smap <C-j> <Plug>snipMateNextOrTrigger

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

" colorscheme slate

" Change cursor when switching modes
:autocmd InsertEnter,InsertLeave * set cul!

" Easy tab switching
nnoremap H gT
nnoremap L gt

" Find files and buffers with fzf
nnoremap <leader>p :Files<CR>
nnoremap <leader>o :Buffers<CR>
nnoremap <leader>f :Ag<CR>

" Fast 3-way merge
nnoremap <leader>g :Gdiffsplit!<CR>

" Easy buffer switching
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-h> <c-w>h
nnoremap <C-l> <c-w>l

" NERDTree settings
nnoremap <leader>n :NERDTreeToggle %<CR>

" ArgWrap mapping
nnoremap <silent> <leader>a :ArgWrap<CR>

" Paste in the end of line mapping
:nmap , $p

" Split everything below
set splitbelow
"set termwinsize=10x0

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

function! DisplayColorSchemes()
   let currDir = getcwd()
   exec "cd $VIMRUNTIME/colors"
   for myCol in split(glob("*"), '\n')
      if myCol =~ '\.vim'
         let mycol = substitute(myCol, '\.vim', '', '')
         exec "colorscheme " . mycol
         exec "redraw!"
         echo "colorscheme = ". myCol
         sleep 2
      endif
   endfor
   exec "cd " . currDir
endfunction

