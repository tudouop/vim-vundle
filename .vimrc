""""""""" Mac 设置 """"""""
set noimdisable
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0

""""""""" vundle 设置 """"""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required

""""""""" 显示相关 """"""""""
set nu 					"显示行号
syntax on 				"语法高亮
set showcmd				"输入的命令显示出来
set scrolloff=3			"光标移动到buffer的顶部和底部时保持3行距离
set ruler				"显示标尺
set cursorline			"突出显示当前行
set background=light
colorscheme solarized

"显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

""""""""" 新文件标题 """""""""""
autocmd BufNewFile *.py,*.sh,*.c exec ":call SetTitle()"
func SetTitle()
	if &filetype == 'sh' 
		call setline(1,"\########################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Author: Marco Lu")
		call append(line(".")+2, "\# Mail: pqlu@tudou.com")
		call append(line(".")+3, "\# Created Time: ".strftime("%c"))
		call append(line(".")+4, "\########################################")
		call append(line(".")+5, "\#!/bin/bash")
		call append(line(".")+6, "")
	endif
	if &filetype == 'python'
		call setline(1,"\########################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Author: Marco Lu")
		call append(line(".")+2, "\# Mail: pqlu@tudou.com")
		call append(line(".")+3, "\# Created Time: ".strftime("%c"))
		call append(line(".")+4, "\########################################")
		call append(line(".")+5, "\#!/usr/bin/python")
		call append(line(".")+6, "")
	endif
	if &filetype == 'c'
		call setline(1, "#include<stdio.h>")
		call append(line("."), "")
	endif
	autocmd BufNewFile * normal G
endfunc

""""""""" 实用设置 """"""""""
set tabstop=4						"设置Tab键宽度
set history=1000					"设置历史记录条数1000
set hlsearch						"设置高亮显示搜索
set ignorecase						"设置搜索忽略大小写
set laststatus=2					"设置显示状态行
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v]\ [%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}	"设置状态行

""""""""" 快捷键设置 """"""""""
map <C-a> ggVGY 					"ctrl+a 全选复制
