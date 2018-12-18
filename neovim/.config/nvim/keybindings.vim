" Keybindings

" Set the leader keys
let g:mapleader = "\<space>"
let g:maplocalleader = ','

" More convenient ESC
inoremap <silent> jj <ESC>

" Setup descriptions
let g:lmaps = {}
let g:llmaps = {}
augroup local_filetype_guides
  au!
  au FileType tex let g:llmaps.l = { 'name' : 'vimtex' }
augroup END

" Re-run commands
nnoremap <silent> <localleader>r @:
let g:llmaps.r = ['@:', 'Rerun last colon command']

" Lame M-x approximation
nnoremap <silent> <leader><leader> :Command<cr>

" Exiting
nnoremap <silent> <leader>q :qa<cr>
let g:lmaps.q = ['qa', 'Quit']
nnoremap <silent> <leader>x :x!<cr>
let g:lmaps.x = ['x!', 'Write and quit']

" Buffer bindings
let g:lmaps.b = {'name': 'Buffers'}
nnoremap <silent> <leader>w :w<cr>
let g:lmaps.w = ['w', 'Write buffer']
nnoremap <silent> <leader>d :Sayonara<cr>
let g:lmaps.d = ['Sayonara', 'Close buffer and window']
nnoremap <silent> <leader>k :Sayonara!<cr>
let g:lmaps.k = ['Sayonara!', 'Close buffer, not window']
nnoremap <silent> <leader>a :bp<cr>
let g:lmaps.a = ['bp', 'Go to previous buffer']
nnoremap <silent> <leader>s :bn<cr> 
let g:lmaps.s = ['bn', 'Go to next buffer']
nnoremap <silent> <leader>bl :b#<cr>
let g:lmaps.b.l = ['b#', 'Go to last used buffer']
nnoremap <silent> <leader>bb :Denite buffer<cr>
nnoremap <silent> <tab> :<c-u>Denite buffer `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'` file_mru<cr>
let g:lmaps.b.b = ['Denite buffer', 'Select a buffer']

" Configuration bindings
let g:lmaps.c = {'name': 'Configuration'}
let g:lmaps.c.s = {'name': 'Sourcing'}
nnoremap <silent> <leader>cst :so %<CR>
let g:lmaps.c.s.t = ['so %', 'Source this file']
nnoremap <silent> <leader>csc :so ~/.config/nvim/init.vim<CR>
let g:lmaps.c.s.c = ['so ~/.config/nvim/init.vim', 'Source config file']
nnoremap <silent> <leader>cc :e ~/.config/nvim/init.vim<CR>
let g:lmaps.c.c = ['e ~/.config/nvim/init.vim', 'Open Neovim config']

" Error bindings
let g:lmaps.e = {'name': 'Errors'}
nnoremap <silent> <leader>eo :lopen<CR>
let g:lmaps.e.c = ['lopen', 'Open error list']
nnoremap <silent> <leader>ec :lclose<CR>
let g:lmaps.e.c = ['lclose', 'Close error list']

" Finder bindings
let g:lmaps.f = {'name': 'Find'}
nnoremap <silent> <leader>ff :Denite file/rec<CR>
let g:lmaps.f.f = ['Denite file/rec', 'Search for files in the current directory']
nnoremap <leader>fa :Denite file/rec <C-r>=getcwd()<CR>
let g:lmaps.f.a = ['Denite file/rec <C-r>=getcwd()<CR>', 'Search for files in an arbitrary directory']
nnoremap <silent> <leader>fg :Denite file/rec/git<CR>
let g:lmaps.f.g = ['Denite file/rec/git', 'Search for files in the current Git repo']
nnoremap <silent> <leader>fh :Denite help<CR>
let g:lmaps.f.h = ['Denite help', 'Search in help tags']
nnoremap <silent> <leader>fr :Denite file/old<CR>
let g:lmaps.f.r = ['Denite file/old', 'Search for recently edited files']
let g:lmaps.f.t = {'name': 'Tags'}
nnoremap <silent> <leader>ftt :Denite tag<CR>
let g:lmaps.f.t.t = ['Denite tag', 'Search in tags for the current directory']
" nnoremap <silent> <leader>ftb :BTags<CR>
" let g:lmaps.f.t.b = ['BTags', 'Search in tags for the current buffer']
nnoremap <silent> <leader>fi :Denite grep<CR>
let g:lmaps.f.i = ['Denite grep', 'Search for text in files in the current directory']
nnoremap <silent> <leader>fl :Denite line<CR>
let g:lmaps.f.l = ['Denite line', 'Search for text in currently open buffers']
" nnoremap  <leader>fL :Locate
" let g:lmaps.f.l = ['Locate', 'Search the system with locate']
let g:lmaps.f.s = {'name': 'Symbols'}
nnoremap <silent> <leader>fsb :Denite documentSymbol<CR>
let g:lmaps.f.s.b = ['Denite documentSymbol', 'Search symbols in the current buffer']
nnoremap <silent> <leader>fsp :Denite workspaceSymbol<CR>
let g:lmaps.f.s.p = ['Denite workspaceSymbol', 'Search symbols in the current project']
nnoremap <silent> <leader>fd :Vaffle<CR>
let g:lmaps.f.d = ['Vaffle', 'Open Vaffle']

" Project bindings
nnoremap <silent> <leader>fp :Denite projectile<cr>
nnoremap <silent> <leader>pt :Denite todo<cr>
nnoremap <silent> <leader>ps :Denite session<cr>

" Toggles
let g:lmaps.t = {'name': 'Toggles'}
nnoremap <silent> <leader>th :nohls<CR>
let g:lmaps.t.h = ['nohls', 'Reset search highlights']
nnoremap <silent> <leader>ts :TagbarToggle<CR>
let g:lmaps.t.s = ['TagbarToggle', 'Toggle Tagbar split']
nnoremap <silent> <leader>tu :UndotreeToggle<CR>
let g:lmaps.t.u = ['UndotreeToggle', 'Toggle Undotree split']
nnoremap <silent> <leader>tw :call Toggle_writer_mode()<CR>
let g:lmaps.t.w = ['call Toggle_writer_mode()', 'Toggle writer mode']

" Version control bindings
let g:lmaps.g = {'name': 'Git'}
nnoremap <silent> <leader>gc :Gcommit<CR>
let g:lmaps.g.c = ['Gcommit', 'Create a git commit']
nnoremap <silent> <leader>gl :Gpull<CR>
let g:lmaps.g.l = ['Gpull', 'Run git pull']
nnoremap <silent> <leader>gp :Gpush<CR>
let g:lmaps.g.p = ['Gpush', 'Run git push']
nnoremap <silent> <leader>gd :Gdiff<CR>
let g:lmaps.g.d = ['Gdiff', 'Display git diff']
nnoremap <silent> <leader>gs :Magit<CR>
let g:lmaps.g.s = ['Magit', 'Display git status']
nnoremap <silent> <leader>gw :Gwrite<CR>
let g:lmaps.g.w = ['Gwrite', 'Write and stage the file']
nnoremap <silent> <leader>gi :FzfGitignore<cr>
let g:lmaps.g.i = [':FzfGitignore', 'Search gitignores']

" Compilation bindings
let g:lmaps.m = {'name': 'Build/Make'}
nnoremap <leader>mi :BuildIt<CR>
let g:lmaps.m.i = ['BuildIt', 'Run BuildIt for the current buffer']
nnoremap <leader>ms :BuildItStatus<CR>
let g:lmaps.m.s = ['BuildItStatus', 'Check the BuildIt status']
nnoremap <localleader>\, <silent> :Dispatch
let g:llmaps[','] = ['Dispatch', 'Run Dispatch']

" REPL and Terminal bindings
tnoremap jj <C-\><C-n>
nnoremap <leader>r :IronRepl<CR>
let g:lmaps.r = ['IronRepl', 'Start the REPL for the current filetype']

" Intero bindings
let g:lmaps.h = {'name': 'Haskell'}
nnoremap <leader>hio :InteroOpen<CR>
let g:lmaps.h.i = {'name': 'Intero'}
let g:lmaps.h.i.o = ['InteroOpen', 'Open Intero']
nnoremap <leader>hik :InteroKill<CR>
let g:lmaps.h.i.k = ['InteroKill', 'Kill Intero']
nnoremap <leader>hic :InteroHide<CR>
let g:lmaps.h.i.c = ['InteroHide', 'Hide Intero']
nnoremap <leader>hil :InteroLoadCurrentModule<CR>
let g:lmaps.h.i.l = ['InteroLoadCurrentModule', 'Load current module in Intero']
nnoremap <leader>hie :InteroEval<CR>
let g:lmaps.h.i.e = ['InteroEval', 'Eval in Intero']
nnoremap <leader>hit :InteroGenericType<CR>
let g:lmaps.h.i.t = ['InteroGenericType', 'Get generic type from Intero']
nnoremap <leader>hiT :InteroType<CR>
let g:lmaps.h.i.T = ['InteroType', 'Get type from Intero']
nnoremap <leader>hii :InteroInfo<CR>
let g:lmaps.h.i.i = ['InteroInfo', 'Get info from Intero']
nnoremap <leader>hiI :InteroTypeInsert<CR>
let g:lmaps.h.i.I = ['InteroTypeInsert', 'Insert type from Intero']
nnoremap <leader>hid :InteroGoToDef<CR>
let g:lmaps.h.i.d = ['InteroGoToDef', 'Go to definition from Intero']
nnoremap <leader>hiu :InteroUses<CR>
let g:lmaps.h.i.u = ['InteroUses', 'Find uses with Intero']

" LanguageClient bindings
let g:lmaps.l = {'name': 'LSP'}
nnoremap <silent> gD :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gI :call LanguageClient#textDocument_implementation()<CR>
nnoremap <silent> <leader>ln :call LanguageClient_textDocument_rename()<CR>
let g:lmaps.l.n = ['call LanguageClient_textDocument_rename()', 'Rename symbol']
nnoremap <silent> <leader>lr :Denite references<CR>
let g:lmaps.l.r = ['Denite references', 'Find symbol references']
nnoremap <silent> <leader>lh :call LanguageClient_textDocument_hover()<CR>
let g:lmaps.l.h = ['call LanguageClient_textDocument_hover()', 'Hover on symbol']
nnoremap <silent> <leader>la :call LanguageClient#textDocument_codeAction()<CR>
let g:lmaps.l.a = ['call LanguageClient#textDocument_codeAction()', 'Code actions at point']
nnoremap <silent> <leader>lf :call LanguageClient_textDocument_formatting()<CR>
let g:lmaps.l.f = ['call LanguageClient_textDocument_formatting()', 'Format document']
nnoremap <silent> <leader>lm :call LanguageClient_contextMenu()<CR>
let g:lmaps.l.m = ['call LanguageClient_contextMenu()', 'Display menu of LC actions']

" Formatting Bindings
nnoremap <silent> <leader>bf :Neoformat<CR>
let g:lmaps.b.f = ['Neoformat', 'Format buffer with Neoformat']

" Easy-Align bindings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Schlepp bindings
vmap <up>    <Plug>SchleppUp
vmap <down>  <Plug>SchleppDown
vmap <left>  <Plug>SchleppLeft
vmap <right> <Plug>SchleppRight

" Journal and note bindings
let g:lmaps.j = {'name': 'Journal'}
nnoremap <silent> <leader>jt :e ~/wiki/journal/<c-r>=strftime("%Y-%m-%d")<cr>.md<cr>
let g:lmaps.j.t = ['e ~/wiki/journal/<c-r>=strftime("%Y-%m-%d")<cr>.md', 'Edit journal entry for today']
nnoremap <silent> <leader>js :Rg .* ~/wiki/journal<cr>
let g:lmaps.j.s = ['Rg .* ~/wiki/journal', 'Search in journal entries']

let g:lmaps.n = {'name': 'Notes'}
nnoremap <silent> <leader>nn :Pad new<cr>
let g:lmaps.n.n = ['Pad new', 'Make a new note']
nnoremap <silent> <leader>nl :Pad ls<cr>
let g:lmaps.n.l = ['Pad ls', 'List notes']
nnoremap <silent> <leader>ns :Files ~/wiki/notes<cr>
let g:lmaps.n.s = ['Files ~/wiki/notes', 'Search notes']

let g:lmaps.p = {'name': 'Plans/Plan notes'}
nnoremap <silent> <leader>ps :Files ~/wiki<cr>
let g:lmaps.p.s = ['Files ~/wiki', 'Search plans/notes']
nnoremap <silent> <leader>pi :e ~/wiki/index.md<cr>
let g:lmaps.p.i = ['e ~/wiki/index.md', 'Go to plan index']

" Leader guide bindings and settings
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <localleader> :<c-u>WhichKeyVisual  ','<CR>

" 2-character Sneak (default)
nmap z <Plug>Sneak_s
nmap Z <Plug>Sneak_S

" visual-mode
xmap z <Plug>Sneak_s
xmap Z <Plug>Sneak_S

" operator-pending-mode
omap z <Plug>Sneak_s
omap Z <Plug>Sneak_S

" repeat motion
map ; <Plug>Sneak_;
map \ <Plug>Sneak_,

" 1-character enhanced 'f'
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F

" visual-mode
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F

" operator-pending-mode
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" 1-character enhanced 't'
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T

" visual-mode
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T

" operator-pending-mode
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

inoremap <silent> <c-t> :Snippets<CR>
