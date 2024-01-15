# Koreksi Bahasa Inggris Pada Markdown Dengan Vim
Terlalu panjang? Ya, ada ide lebih baik?

1. Tambahkan pengaturan ini pada `.vimrc` Anda.
  ```vimrc
  let g:english_words_file = expand('~/.vim/english-words.txt')
  let g:english_words_pattern = '\v\m\<(' . join(readfile(g:english_words_file), '\|') . '\>'
  let g:italic_enabled = 1
  function! ToggleItalic()
    if g:italic_enabled
      autocmd! UniversalAutoCmd
      let g:italic_enabled = 0
      echo "Italic mode disabled"
    else
      autocmd BufWritePre *.md call AddItalicForEnglishWords()
      let g:italic_enabled = 1
      echo "Italic mode enabled"
    endif
   endfunction
  function! AddItalicForEnglishWords()
   let l:current_line = getline('.')
   let l:modified_line = substitute(l:current_line, g:english_words_pattern, '_\0_', 'g')
   call setline(line('.'), l:modified_line)
  endfunction
  augroup UniversalAutoCmd
    autocmd!
    autocmd BufWritePre *.md call AddItalicForEnglishWords()
  augroup END
  nnoremap <leader>ti :call ToggleItalic()<CR>
  ```

2. Buat file `english-words.txt` pada `.vim/` dengan perintah.
  ```bash
  $ touch .vim/english-words.txt
  ```

  Sebagai contoh, isi dari `english-words.txt` dapat di isi dari [website ini](https://www.ef.com/wwen/english-resources/english-vocabulary/top-3000-words/).

## Hasil
Ini yang kalian tunggu-tunggu, bukan?

https://github.com/sukalaper/koreksi-bahasa-inggris-pada-markdown-dengan-vim/assets/65320033/b61f2a7c-647d-4b2b-82e0-b2c2acc94119

> Saya kagok, maaf atas demonstrasi yang buruk.

