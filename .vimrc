" Pathogen
execute pathogen#infect()

filetype plugin indent on
" Color scheme
syntax on
colorscheme onedark
highlight Normal ctermbg=NONE guibg=NONE
set termguicolors "true colors

" Word wrap
:set wrap
:set linebreak

" copy and paste
vnoremap <C-c> "+y
map <C-v> "+p

" Indent config
set sts=4
set ts=4
set sw=4

" Relative line number
set relativenumber
" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" Navigation between buffers
execute "set <M-1>=\e1"
execute "set <M-2>=\e2"
execute "set <M-3>=\e3"
execute "set <M-4>=\e4"
execute "set <M-5>=\e5"
execute "set <M-6>=\e6"
execute "set <M-d>=\ed"
nnoremap <silent> <M-h> ":wincmd h" <CR>
nnoremap <silent> <M-j> ":wincmd j" <CR>
nnoremap <silent> <M-k> ":wincmd k" <CR>
nnoremap <silent> <M-l> ":wincmd l" <CR>
nnoremap <silent> <M-d> :bd<CR> "delete the current buffer

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


