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
set expandtab
set smartindent

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
set foldmethod=indent

"" spell checking
 set spell
 setlocal spell spelllang=ru_ru,en_us

set autochdir 
set showcmd 

" python abbreviation
ab ipdb import ipdb; ipdb.set_trace()
ab pudb import pudb; pudb.set_trace()

" mapping
map <F1> :Vifm .<CR> 

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
autocmd BufNewFile,BufRead *.tpl call DetectTemplate()

"" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'joshdick/onedark.vim' " color scheme
Plug 'neovim/python-client'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vifm/neovim-vifm'
Plug 'brettanomyces/nvim-terminus'
Plug 'jsfaint/gen_tags.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'gryf/pep8-vim'

call plug#end() " initialize plugin system

"" init onedark theme
colorscheme onedark

"" init deoplete
let g:deoplete#enable_at_startup = 1
