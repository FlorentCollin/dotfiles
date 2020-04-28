" --------------- "
" --> Plugins <-- "
" --------------- "
call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'christianchiarulli/onedark.vim'

" Initalize plugin system
call plug#end()

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
"colorscheme onedark
colorscheme nord

" Leader key setting
nnoremap <SPACE> <Nop>
let mapleader=" "

" Tab settings
set sts=4
set ts=4
set sw=4
set smartindent
" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Clear highlight when <esc> is pressed
nnoremap <esc> :noh<return><esc>

" Relative Number
set number relativenumber
set nu rnu

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
let b:airline_whitespace_disabled = 1
let g:airline#extensions#tabline#enabled = 0

" Vim-Which-Keys
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Nvim colorizer lua
lua require'colorizer'.setup()


" FZF configuration
source $HOME/.config/nvim/plug-config/fzf.vim
" Coc.nvim configuration
source $HOME/.config/nvim/plug-config/coc.vim
