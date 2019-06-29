" Pathogen
execute pathogen#infect()

filetype plugin indent on
filetype plugin on
" Color scheme
syntax on
colorscheme codedark
highlight Normal ctermbg=NONE guibg=NONE
set termguicolors "true colors
let g:go_higlight_types = 1

" Word wrap
:set wrap
:set linebreak

" copy and paste
vnoremap <C-S-c> "+y
map <C-S-v> "+p

" Leader Key
map <Space> <leader>

" Indent config
set sts=4
set ts=4
set sw=4
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" Scroll faster with <C-e> and <C-y>
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Relative line number
set relativenumber

" NERDTree keybind
map <silent> <C-n> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='l'
" Close NERDTree when this is the only window left 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Fuzzy Finder
set rtp+=~/.fzf

" Ranger in VIM
fun! RangerChooser()
  exec "silent !ranger --choosefile=/tmp/chosenfile " .           expand("%:p:h")
  if filereadable('/tmp/chosenfile')
    exec 'edit ' . system('cat /tmp/chosenfile')
    call system('rm /tmp/chosenfile')
  endif
  redraw!
endfun

map <Leader>r :call RangerChooser()<CR>

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Vim-javascript
let g:javascript_plugin_flow = 1

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

