"" line numbering
set number 
set relativenumber 

"" file format
set fileformat=unix 
set encoding=utf-8 
set termencoding=utf-8 
set fileencoding=utf-8

"" tab
set tabstop=4 
set softtabstop=4 
set autoindent 
set shiftwidth=4 
set smarttab 

"" syntax highlighting
filetype plugin on
syntax on

"" search
set incsearch 
set ignorecase 

"" line wrapping
set wrap 
set linebreak 
set breakindent 

"" folding
set foldenable 
set foldmethod=syntax 

"" spell checking
 set spell
 setlocal spell spelllang=ru_ru

set autochdir 
set showcmd 

"" hack to help vim define django templates from html
fun! DetectTemplate()
  let n = 1
  while n < line("$")
    if getline(n) =~ '{%' || getline(n) =~ '{{'
      set ft=htmldjango
      return
    endif
    let n = n + 1
  endwhile
  set ft=html "default html
endfun
autocmd BufNewFile,BufRead *.html call DetectTemplate()

"" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'joshdick/onedark.vim' " color scheme
Plug 'davidhalter/jedi-vim' " autocomletion

call plug#end() " initialize plugin system

colorscheme onedark
