" Pathogen
execute pathogen#infect()

filetype plugin indent on
filetype plugin on
" Color scheme
syntax on
colorscheme onedark
highlight Normal ctermbg=NONE guibg=NONE
set termguicolors "true colors
let g:go_higlight_types = 1

" Word wrap
:set wrap
:set linebreak

" copy and paste
vnoremap <C-S-c> "+y
map <C-S-v> "+p

" Indent config
set sts=2
set ts=2
set sw=2

" Relative line number
set relativenumber

" NERDTree keybind
map <silent> <C-n> :NERDTreeFocus<CR>

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

" Gopls autocompletion go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
set autowrite
let g:go_fmt_command='goimports'


" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Vim-javascript
let g:javascript_plugin_flow = 1
