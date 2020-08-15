lua require'nvim_lsp'.clangd.setup{}
lua require'nvim_lsp'.pyls.setup{}
lua require'nvim_lsp'.rust_analyzer.setup{}
lua require'nvim_lsp'.tsserver.setup{}
lua require'nvim_lsp'.dockerls.setup{}
lua require'nvim_lsp'.vimls.setup{}

autocmd Filetype typescript,typescript.tsx,javascript,javascriptreact,python,go,c,cpp,rust,dockerfile setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Auto-format *.rs files prior to saving them
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Keybindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> R    <cmd>lua vim.lsp.buf.rename()<CR>

nnoremap <silent> <leader><leader> <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>
nnoremap <silent> <leader>, <cmd>lua vim.lsp.buf.code_action()<CR>
