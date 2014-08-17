set nocompatible
set softtabstop=4
set sw=4
set ts=4
set autoindent
let NERDTreeIgnore=['\.pyc$','\.o$','\.eps$','\.png$','\.jpg','\.bz2','\.gz','\.aux$','\.blg$','\.out$','\.fdb_latexmk$','\.log$','\.fls$','\.bbl$','\.pdf$','.spl$','.bst$','.cls$']
set autochdir
set foldmethod=indent
set foldnestmax=7
set foldlevel=100
set nu
set guifont=Monaco\ 11
set gfw=Microsoft\ YaHei\ 12
set guioptions-=T
set guioptions-=m
set guioptions-=L
set hls
set nojoinspaces
syntax on
colorscheme evening

" Settings related to tex file
autocmd BufRead *.tex set lines=26 tw=75 wm=0 lbr spell spelllang=en guioptions-=r

" Spell Checker
let g:languagetool_jar='$HOME/bin/LanguageTool-2.6/languagetool-commandline.jar'


" fcitx Chinese auto active/inactive switching
let g:input_toggle = 1
function! Fcitx2en()
	let s:input_status = system("fcitx-remote")
    if s:input_status == 2
		let g:input_toggle = 1
		let l:a = system("fcitx-remote -c")
	endif
endfunction

function! Fcitx2zh()
	let s:input_status = system("fcitx-remote")
	if s:input_status != 2 && g:input_toggle == 1
		let l:a = system("fcitx-remote -o")
		let g:input_toggle = 0
	endif
endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
autocmd InsertEnter * call Fcitx2zh()

