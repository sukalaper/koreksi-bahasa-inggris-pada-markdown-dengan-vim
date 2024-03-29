let g:english_words_file = expand('~/.vim/plugged/koreksi-bahasa-inggris-pada-markdown-dengan-vim/kumpulan-kata-bahasa-inggris.txt')
let g:english_words_pattern = '\v\m\<(' . join(readfile(g:english_words_file), '\|') . '\>'
let g:italic_enabled = 0

function! ToggleItalic()
  if g:italic_enabled
    autocmd! MarkdownAutoCmd
    let g:italic_enabled = 0
    echo "Kamus koreksi pada bahasa Inggris di nonaktifkan!"
  else
    augroup MarkdownAutoCmd
      autocmd!
      autocmd BufWritePre *.md call AddItalicForEnglishWords()
    augroup END
    let g:italic_enabled = 1
    echo "Kamus koreksi pada bahasa Inggris di aktifkan!"
  endif
endfunction

function! AddItalicForEnglishWords()
  let l:current_line = getline('.')
  let l:modified_line = substitute(l:current_line, g:english_words_pattern, '_\0_', 'g')
  call setline(line('.'), l:modified_line)
endfunction

augroup MarkdownAutoCmd
  autocmd!
  autocmd BufWritePre *.md if g:italic_enabled | call AddItalicForEnglishWords() | endif
augroup END

nnoremap <leader>l :call ToggleItalic()<CR>
