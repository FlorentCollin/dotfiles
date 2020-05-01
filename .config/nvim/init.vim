" --------------- "
" --> Plugins <-- "
" --------------- "
call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'christianchiarulli/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'airblade/vim-rooter'

" Markdown integration
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Initalize plugin system
call plug#end()

" Load the vim package for debugging with gdb
packadd! termdebug

" ------------------ "
" --> VIM Config <-- "
" ------------------ "

" Global Settings
set hidden
set incsearch
set ignorecase

set noshowmode  " to get rid of thing like --INSERT--
set shortmess+=F  " to get rid of the file name displayed in the command line bar

" Colorscheme
syntax on
set termguicolors
set background=dark
colorscheme nord
"colorscheme onedark

" set leader key
let g:mapleader = "\<Space>"

" Tab settings
set sts=4
set ts=4
set sw=4
set expandtab
set smartindent

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Relative Number
set number relativenumber
set nu rnu

" Clear highlight when <esc> is pressed
nnoremap <esc> :noh<return><esc>

" Terminal configuration
au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

" Copy paste
vmap <C-c> "+y
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Better split creation
set splitbelow
set splitright

" Keymapping for splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Move selection up or down with J and K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Stop newline continuation on comments
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" ------------------------------ "
" --> Plugins Configuration <--  "
" ------------------------------ "

" NERDCommenter remap
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" DelimitMate configurations
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

" Vim-airline
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 0
let g:airline#extensions#tabline#enabled = 0

" Nvim colorizer lua
lua require'colorizer'.setup()

" Vim-Markdown
let g:vim_markdown_math = 1

source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim

