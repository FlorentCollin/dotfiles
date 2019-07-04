" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim' " Comment line with one shortcut
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy Finder in vim
Plug 'scrooloose/nerdtree' " File tree 
Plug 'vim-airline/vim-airline' " Status Bar 
Plug 'vim-airline/vim-airline-themes' " Status Bar theme
Plug 'sheerun/vim-polyglot' " Syntax highlighting for a lot of different languages
Plug 'editorconfig/editorconfig-vim' " Config file for project
Plug 'ervandew/supertab' " Tab completion
Plug 'easymotion/vim-easymotion' " Easy jump to part of a file 
Plug 'vim-syntastic/syntastic' " Syntax checking plugin
Plug 'moll/vim-node' " Allow gf on node syntax
" YouCompleteMe with AutoInstall
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

"  You will load your plugin here
"  Make sure you use single quotes
" Initialize plugin system
call plug#end()

" Color scheme
syntax on
colorscheme codedark
" BOLD
hi Identifier cterm=bold
hi Function cterm=bold
hi Statement cterm=bold
hi Conditional cterm=bold
hi Keyword cterm=bold
hi Repeat cterm=bold
hi PreProc cterm=bold
hi Include cterm=bold
hi Define cterm=bold
hi Macro cterm=bold
hi PreCondit cterm=bold
hi pythonStatement cterm=bold
hi pythonExClass cterm=bold
hi pythonNone cterm=bold
hi pythonBoolean cterm=bold
hi pythonTodo cterm=bold
hi pythonClassVar cterm=bold
hi pythonClassDef cterm=bold


" copy and paste
vnoremap <C-S-c> "+y
map <C-S-v> "+p

" Relative line number
set relativenumber
set nu

" Enter = add one line 
map <CR> o<Esc>

" Save the file when you don't you are not allowed to write the file
cmap w!! %!sudo tee > /dev/null %

" Moving between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Scroll faster with <C-e> and <C-y>
nnoremap <C-j> 2<C-e>
nnoremap <C-k> 2<C-y>

" Map leader key to the spacebar
map <Space> <leader>
map \ <leader>

" Remap <Leader>// to comment and uncomment lines of code
noremap <silent> <Leader>// :TComment<CR>

" NERDTree keybinds
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
" Auto quit vim when NERDTree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Enter in a folder by pressing 'l' 
let NERDTreeMapActivateNode = 'l'

" Airline (powerline fonts)
let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 1
" Reduce the latency when changing from mode to another mode
set ttimeoutlen=0
" Remove vim mode information line
set noshowmode

" SuperTab default completion type
let g:SuperTabDefaultCompletionType = "<c-n>"


" Leader F is for file related mappîngs (open, browse...)
nnoremap <silent> <Leader>f :CtrlP<CR>
" nnoremap <silent> <Leader>fm :CtrlPMRU<CR>
let g:ctrlp_working_path_mode = 'ra'
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl B for buffer related mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>bb :CtrlPBuffer<CR> " cycle between buffer
nnoremap <silent> <Leader>bn :bn<CR> "create (N)ew buffer
nnoremap <silent> <Leader>bd :bdelete<CR> "(D)elete the current buffer
nnoremap <silent> <Leader>bu :bunload<CR> "(U)nload the current buffer
nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer"

" Syntastic config
set statusline+=%#warningmsg#                                   "syntastic
set statusline+=%{SyntasticStatuslineFlag()}                    "syntastic
set statusline+=%*                                              "syntastic

let g:syntastic_always_populate_loc_list = 1                    "syntastic
let g:syntastic_auto_loc_list = 1                               "syntastic
let g:syntastic_check_on_open = 0                               "syntastic
let g:syntastic_check_on_wq = 0                                 "syntastic

" Syntastic JavaScript config
let g:syntastic_javascript_checkers = ['eslint']

" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_autoclose_preview_window_after_completion = 1
set splitbelow
" Don't show YCM's preview window 
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0

" reloads .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
