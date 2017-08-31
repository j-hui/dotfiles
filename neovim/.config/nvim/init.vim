" Use full Vim features
if &compatible
  set nocompatible               " Be iMproved
endif

" Config file path
let g:config_path = "~/.config/nvim/"

" Function for sourcing config modules
function! ConfigInc(module)
  execute 'source ' . fnameescape(g:config_path) . fnameescape(a:module)
endfunction

" Set Python host program to speed up loading
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

" Add in plugins
call ConfigInc('plugins.vim')

" Functions
call ConfigInc('functions.vim')

" Autocommands
" Main Autocommands
call ConfigInc('autocmds.vim')

" Keybindings
call ConfigInc('keybindings.vim')

" Haskell settings
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1

" Eclim settings
let g:EclimCompletionMethod = 'omnifunc'

" Rainbow parens settings
let g:rainbow_active = 1

" Airline settings
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Opam/OCaml settings
" These take time, so we only want to run them if we're editing OCaml
function! Setup_Ocaml()
  let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
  execute "set rtp+=" . g:opamshare . "/merlin/vim"
  execute "helptags " . g:opamshare . "/merlin/vim/doc"
  execute "set rtp^=" . g:opamshare . "/ocp-indent/vim"
endfunction

" Ale settings
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '➤'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
      \ 'haskell': ['hdevtools', 'hlint'],
      \ 'cpp': ['clang', 'clangcheck', 'cppcheck', 'cpplint']
      \}
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_set_highlights = 1
let g:ale_cpp_cpplint_options = '--linelength=100'

" Neomake settings
let g:neomake_cpp_clang_args = ['-std=c++14']
let g:neomake_python_enabled_makers = ['flake8', 'pyflakes', 'vulture']
let g:neomake_open_list = 2

" IndentLine settings
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
let g:indentLine_faster = 1

" Pandoc settings
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#after#modules#enabled = ['ultisnips', 'unite']
let g:pandoc#formatting#mode = 'haA'
let g:pandoc#formatting#textwidth = 100
let g:pandoc#completion#bib#use_preview = 1
let g:pandoc#command#autoexec_on_writes = 0
let g:pandoc#command#autoexec_command = 'make'
let g:pandoc#modules#disabled = ["folding"]

" Vimtex settings
let g:tex_flavor = "latex"
let g:tex_conceal = ""
let g:vimtex_compiler_progname = "nvr"

" Ultisnips settings
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" Syntastic settings
let g:syntastic_ocaml_checkers=['merlin','caml4po']

" VimFiler settings
let g:vimfiler_as_default_explorer = 1

" Undotree settings
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" Tagbar settings
let g:tagbar_type_haskell = {
      \ 'ctagsbin'  : 'hasktags',
      \ 'ctagsargs' : '-x -c -o-',
      \ 'kinds'     : [
      \  'm:modules:0:1',
      \  'd:data: 0:1',
      \  'd_gadt: data gadt:0:1',
      \  't:type names:0:1',
      \  'nt:new types:0:1',
      \  'c:classes:0:1',
      \  'cons:constructors:1:1',
      \  'c_gadt:constructor gadt:1:1',
      \  'c_a:constructor accessors:1:1',
      \  'ft:function types:1:1',
      \  'fi:function implementations:0:1',
      \  'o:others:0:1'
      \ ],
      \ 'sro'        : '.',
      \ 'kind2scope' : {
      \ 'm' : 'module',
      \ 'c' : 'class',
      \ 'd' : 'data',
      \ 't' : 'type'
      \ },
      \ 'scope2kind' : {
      \ 'module' : 'm',
      \ 'class'  : 'c',
      \ 'data'   : 'd',
      \ 'type'   : 't'
      \ }
      \ }

let g:tagbar_type_rust = {
      \ 'ctagstype' : 'rust',
      \ 'kinds' : [
      \'T:types,type definitions',
      \'f:functions,function definitions',
      \'g:enum,enumeration names',
      \'s:structure names',
      \'m:modules,module names',
      \'c:consts,static constants',
      \'t:traits,traits',
      \'i:impls,trait implementations',
      \]
      \}

let g:tagbar_type_elixir = {
      \ 'ctagstype' : 'elixir',
      \ 'kinds' : [
      \ 'f:functions',
      \ 'functions:functions',
      \ 'c:callbacks',
      \ 'd:delegates',
      \ 'e:exceptions',
      \ 'i:implementations',
      \ 'a:macros',
      \ 'o:operators',
      \ 'm:modules',
      \ 'p:protocols',
      \ 'r:records'
      \ ]
      \ }

" Racer settings
let g:racer_cmd = "/usr/bin/racer"

" Gitgutter settings
set updatetime=500
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_added = '＋'
highlight GitGutterAdd guifg = '#A3E28B'

" Vimwiki settings
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_list = [{'path': '$HOME/wiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" Goyo settings
let g:goyo_width = 110

" Colorscheme
colorscheme hybrid
" Highlighting tweaks
augroup color_tweaks
  autocmd!
  autocmd ColorScheme * highlight Todo cterm=bold ctermfg=0 ctermbg=3 gui=bold guifg=#3B4252 guibg=#EBCB8B | highlight Comment cterm=bold ctermfg=8 ctermbg=NONE gui=bold guifg=#D8DEE9 guibg=NONE | highlight LineNr guifg=#777777
augroup END

" Slime settings
let g:slime_target = "tmux"

" FZF settings
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Startify settings
let g:startify_list_order = [
      \ ['Update'], 'commands', 
      \ ['Recent Files in Directory'], 'dir', 
      \ ['Recent Files'], 'files', 
      \ ['Bookmarks'], 'bookmarks', 
      \ ['Sessions'], 'sessions']
let g:startify_commands = [{'u': ['Update plugins', ':PlugUpdate']}, {'g': ['Upgrade Plug.vim', ':PlugUpgrade']}]
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = []

" Vim-rooter settings
" Add language-builder patterns before source control for nested projects
let g:rooter_patterns = ['.catkin_workspace', 'Cargo.toml', 'stack.yaml', '*.cabal', 'Makefile', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1
let g:rooter_manual_only = 1
let g:rooter_change_directory_for_non_project_files = 'current'

" Deoplete settings
let g:deoplete#enable_at_startup = 0
let g:deoplete#auto_complete_delay = 100
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#skip_chars = ['(', ')', '<', '>']
let g:deoplete#ignore_sources = {
  \ 'python': ['neoinclude']
  \}

let g:deoplete#sources#jedi#server_timeout = 60

let g:deoplete#omni#input_patterns = {
  \  'ocaml': '[^ ,;\t\[()\]]',
  \  'markdown': '@',
  \  'pandoc': '@',
  \  'tex': '\\(?:'
  \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
  \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
  \ . '|hyperref\s*\[[^]]*'
  \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
  \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
  \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
  \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
  \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
  \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
  \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
  \ . '|\w*'
  \ .')',
  \  'scala': [
  \ '[^. *\t]\.\w*',       
  \ '[:\[,] ?\w*',         
  \ '^import .*'           
  \] 
  \}
" YCM Semantic trigger regexes for use with deoplete if necessary
"let g:ycm_semantic_triggers =  {
"\   'c' : ['->', '.'],
"\   'objc' : ['->', '.'],
"\   'ocaml' : ['.', '#'],
"\   'cpp,objcpp' : ['->', '.', '::'],
"\   'perl' : ['->'],
"\   'php' : ['->', '::'],
"\   'cs,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"\   'java,jsp' : ['.'],
"\   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
"\   'ruby' : ['.', '::'],
"\   'lua' : ['.', ':'],
"\   'erlang' : [':'],
"\   'tex': [
"\ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
"\ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
"\ 're!\\hyperref\[[^]]*',
"\ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
"\ 're!\\(include(only)?|input){[^}]*',
"\ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
"\ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
"\ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
"\ ],
"\  'markdown': ['@'],
"\  'pandoc': ['@'],
"\  'haskell': ['.']
"\ }

" LanguageClient Settings
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['pyls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'go': ['~/go/bin/go-langserver'],
    \ 'haskell': ['hie', '--lsp'],
    \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsDisplay = {
    \ 1: {
    \     "name": "Error",
    \     "texthl": "ALEError",
    \     "signText": "✖",
    \     "signTexthl": "ALEErrorSign"
    \ },
    \ 2: {
    \     "name": "Warning",
    \     "texthl": "ALEWarning",
    \     "signText": "➤",
    \     "signTexthl": "ALEWarningSign"
    \ },
    \ 3: {
    \     "name": "Information",
    \     "texthl": "LanguageClientInformation",
    \     "signText": "i",
    \     "signTexthl": "SignInformation"
    \ },
    \ 4: {
    \     "name": "Hint",
    \     "texthl": "LanguageClientHint",
    \     "signText": ".",
    \     "signTexthl": "SignHint"
    \ }
  \ }

let g:LanguageClient_signColumnAlwaysOn = 0
let g:LanguageClient_diagnosticsEnable = 0

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" SuperTab settings
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

" Vim-qf settings
let g:qf_auto_open_quickfix = 0
let g:qf_auto_open_loclist = 0

" Parenmatch settings
let g:loaded_matchparen = 1

" Easygit settings
let g:easygit_enable_command = 1

" Prosession settings
let g:prosession_tmux_title = 1
let g:prosession_on_startup = 0

" Custom commands
call ConfigInc("commands.vim")

" General settings
call ConfigInc('settings.vim')
