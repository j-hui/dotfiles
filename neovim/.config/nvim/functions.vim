" Custom functions

function! Toggle_writer_mode()
  execute ":Goyo"
  execute ":Limelight!!"
endfunction

function! Writer_checks_on()
  execute ":DittoOn"
endfunction

function! Writer_checks_off()
  execute ":DittoOff"
endfunction

function! TrimGuideDisplay()
  let g:leaderGuide#displayname =
        \ substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
  let g:leaderGuide#displayname =
        \ substitute(g:leaderGuide#displayname, '^<Plug>', '', '')
endfunction

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineBuffers()
   " return lightline#bufferline#buffers() . (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : '')
   let l:bfs = lightline#bufferline#buffers()
   call map(l:bfs, {ind, val -> len(val) ? [fnamemodify(val[0], ':t') . ' ' . WebDevIconsGetFileTypeSymbol(val[0])] : []})
   return l:bfs
endfunction

" Stolen from https://github.com/saaguero/dotvim
function! LoadUltiSnips()
  let l:curpos = getcurpos()
  execute plug#load('ultisnips')
  call cursor(l:curpos[1], l:curpos[2])
  call UltiSnips#ExpandSnippet()
  return ""
endfunction
