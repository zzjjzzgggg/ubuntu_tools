set nocompatible
set softtabstop=4
set sw=4
set ts=4
set autoindent
let NERDTreeIgnore = ['\.pyc$','\.o$','\.eps$','\.png$','\.jpg','\.bz2','\.gz','\.aux$','\.blg$','\.out$','\.fdb_latexmk$','\.log$','\.fls$','\.bbl$','\.pdf$','.spl$','.bst$','.cls$']
set autochdir
set foldmethod=indent
set foldnestmax=7
set foldlevel=100
set nu
set guifont=Monaco\ 11
set guioptions-=T
set guioptions-=m
set guioptions-=L
set hls
set nojoinspaces
syntax on
colorscheme evening

let g:languagetool_jar='$HOME/bin/LanguageTool-2.3/languagetool-commandline.jar'
autocmd BufRead *.tex set lines=31 tw=75 wm=0 lbr spell spelllang=en guioptions-=r
