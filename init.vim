"" нумерация строк
set number " номера строк
set relativenumber " относительные номера строк

"" формат файла
set fileformat=unix " форматирование в unix формат файлов по умолчанию
set encoding=utf-8 " кодировка
set termencoding=utf-8 " кодировка терминала
set fileencoding=utf-8 " кодировка сохранения файла

"" табуляция
set tabstop=4 " размер табуляции
set softtabstop=4 " количество пробелов
set autoindent " авто отступ
set shiftwidth=4 " размер отступов
set smarttab " умные отступы

"" подсветка синтаксиса
filetype plugin on
syntax on

"" поиск
set incsearch " перескакивать на текст
set ignorecase " игнорировать регистр

"" перенос строк
set wrap " перенос строк
set linebreak " умный перенос строк
set breakindent " перенос с отступом

"" фолдинг
set foldenable " включение
set foldmethod=syntax " метод фолдинга

set autochdir " автоматический переход в директорию файла
set showcmd " отображение действий

"" проверка орфографии
 set spell
 setlocal spell spelllang=ru_ru

"" хак для помощи vim определения шаблонов django от html
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
