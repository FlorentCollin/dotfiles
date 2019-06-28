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
set sts=4
set ts=4
set sw=4
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

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

" YouCompleteMe settings
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
