execute pathogen#infect()

filetype plugin indent on
syntax on

set relativenumber

inoremap jk <Esc>
inoremap <F1> <C-n>
map <C-o> :NERDTreeToggle<CR>
"inoremap <Tab> <C-n>

"let g:airline_theme='luna'
"colorscheme snow
let g:airline_theme='badwolf'
colorscheme dracula
"colorscheme kalisi

"colorscheme cobalt
"colorscheme simo-zz-2
"colorscheme elit

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

set listchars=trail:·,tab:→\
set list
set timeoutlen=100


set tabstop=4
set shiftwidth=4
set expandtab

set autoindent
set hidden
set mouse=a
set diffopt=vertical

hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=NONE
"hi Special ctermbg=NONE ctermfg=CYAN
"hi Comment ctermbg=NONE ctermfg=DarkGrey
"hi LineNr ctermbg=NONE ctermfg=White

"autocmd BufNewFile,BufRead *.js !osascript ~/randomdesktop.applescript
autocmd BufNewFile,BufRead *.js silent !osascript ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/js.jpg
autocmd BufNewFile,BufRead *.yml silent !osascript  ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/yml.jpg
autocmd BufNewFile,BufRead *.html silent !osascript ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/html.jpg
autocmd BufNewFile,BufRead *.scss silent !osascript ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/scss.png
autocmd BufNewFile,BufRead *.py silent !osascript ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/calvin_and_hobbes/candh12.jpg
autocmd BufNewFile,BufRead *.css silent !osascript ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/css.jpg
autocmd BufNewFile,BufRead *.md silent !osascript ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/md.jpg
autocmd BufNewFile,BufRead *.gitignore silent !osascript ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/gitignore.jpg
autocmd BufNewFile,BufRead *.json silent !osascript ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/json.jpg
autocmd BufNewFile,BufRead *.c silent !osascript ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/calvin_and_hobbes/candh14.jpg
autocmd BufNewFile,BufRead *.h silent !osascript ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/calvin_and_hobbes/candh13.jpg
autocmd BufNewFile,BufRead *.sh silent !osascript ~/Documents/misc/config_files/changeITermBackgroundImage.scpt ~/Pictures/calvin_and_hobbes/candh11.jpg

"use docx2txt.pl to allow VIm to view the text content of a .docx file directly.
autocmd BufReadPre *.docx set ro
autocmd BufReadPost *.docx %!docx2txt.pl
