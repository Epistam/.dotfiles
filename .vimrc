" Cool sessions vimrc v2 (cuz I deleted the first one like a fucking retard)

" General purpose formatting
set nu
set ts=4
set shiftwidth=0 

" LaTeX
autocmd Filetype plaintext setlocal tw=150
"autocmd Filetype tex setlocal tw=150
autocmd Filetype tex setlocal tw=85 "Text wrapping for half screen
"autocmd Filetype tex inoremap {  {}<left>
"autocmd Filetype tex inoremap {<CR> {<CR>}<ESC>0
"autocmd Filetype tex inoremap {;<CR> {<CR>};<ESC>0

" Colorscheme
colorscheme slate
highlight Folded ctermbg=8 ctermfg=250

" Sessions (!)
function! MakeSession()
  "let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessiondir = getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/.vimsess'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  "let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessiondir = getcwd()
  let b:sessionfile = b:sessiondir . "/.vimsess"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" Adding automatons for when entering or leaving Vim
"au VimEnter * nested :call LoadSession()
"au VimLeave * :call MakeSession()

" Adding automatons for when entering or leaving Vim v2
au VimEnter * if argc() == 0 | call LoadSession() | endif
au VimLeave * if argc() == 0 | call MakeSession() | endif
