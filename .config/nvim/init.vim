" --------------- "
" --> Plugins <-- "
" --------------- "
call plug#begin()

" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'huyvohcmc/atlas.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tomasiser/vim-code-dark'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'chuling/ci_dark'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'airblade/vim-rooter'
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'
Plug 'voldikss/vim-floaterm'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'

" LSP
Plug 'neovim/nvim-lsp'

call plug#end()

" ------------------ "
" --> VIM Config <-- "
" ------------------ "

" Global Settings
set hidden
set incsearch
set inccommand=nosplit " Show modification feedback when using :substitute
set ignorecase
set completeopt=longest,menuone
set signcolumn=yes
set noshowmode  " to get rid of thing like --INSERT--
set shortmess+=F  " to get rid of the file name displayed in the command line bar

" Set leader key
let g:mapleader = "\<Space>"

" Enable integrated highlight on yank
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("YankRegion", 1000)


" Colorscheme
syntax on
set background=dark
colorscheme quantum
set termguicolors

" Relative Number
set number relativenumber

" Set fold method to manual
set foldmethod=manual
set foldlevel=99

" Always show at least one line above/below the cursor.
set scrolloff=1

" Tab settings
set sts=4
set ts=4
set sw=4
set expandtab
set smartindent

" Better tabbing
vnoremap << <gv
vnoremap >> >gv

" Language-aware completion
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Clear highlight when <esc> is pressed
nnoremap <esc> :noh<return><esc>

" Terminal configuration
au TermOpen * setlocal listchars= nonumber norelativenumber
au TermOpen * startinsert
au BufEnter,BufWinEnter,WinEnter term://* startinsert
au BufLeave term://* stopinsert
if has('nvim')
  "tnoremap <Esc> <C-\><C-n>
endif

" Copy paste
vmap <C-c> "+y
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Better split creation
set splitbelow
set splitright

" Stop newline continuation on comments
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Activate the mouse usage (useful for presentation)
set mouse=a

" Currently tested settings
set showbreak=↪

" Keymapping for splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use Meta + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>


" ------------------------------ "
" --> Plugins Configuration <--  "
" ------------------------------ "

" NERDCommenter remap
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" DelimitMate configurations
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

" Lightline
let g:lightline = {
      \ 'colorscheme': 'quantum',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status'
      \ },
      \   'separator': {
      \     'left': '',
      \     'right': ''
      \ },
      \ }

" Nvim colorizer lua
lua require'colorizer'.setup()

source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/nvim-lsp.vim

nnoremap <Leader>` :Colors<CR>
