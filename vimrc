"设置系统终端vim配色
syntax enable
"colorscheme solarized
"if &to_Co > 1
"	syntax enable
"endif
"syntax clear
"syntax off

"if has('gui_running')
"    set background=light
"else
"	set background=dark
"endif

"去掉vi一致性
set nocompatible
"自动对齐
set autoindent
set history=50
"set autochdir

"set laststatus=2"总显示最后一个窗口的状态行
filetype plugin on
filetype plugin indent on

"设置键入字符开始搜索
set incsearch

"设置（软）制表符宽度为4：
set tabstop=4
set softtabstop=4
"设置缩进的空格数为4
set shiftwidth=4
"设置自动缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置：
"set autoindent
"设置使用 C/C++ 语言的自动缩进方式：
set cindent

"set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} 

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"-----------------------------新建文件-----------------------------------------------
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头
func SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1,"\#!/bin/bash")
		call append(line("."), "")
	elseif &filetype == 'python'
		call setline(1,"#!/usr/bin/env python")
		call append(line("."),"# coding=utf-8")
		call append(line(".")+1, "")
	elseif &filetype == 'ruby'
		call setline(1,"#!/usr/bin/env ruby")
		call append(line("."),"# encoding: utf-8")
		call append(line(".")+1, "")
	"elseif &filetype == 'mkd'
	"	call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	endif
	if expand("%:e") == 'cpp'
		call setline(1, "#include<iostream>")
		call append(line("."), "using namespace std;")
		call append(line(".")+1, "")
	endif
	if &filetype == 'c'
		call setline(1, "#include<stdio.h>")
		call append(line("."), "")
		call append(line(".")+1, "int main(int argc, char *argv[])")
		call append(line(".")+2, "")
	endif
	if &filetype == 'java'
		call setline(1,"public class ".expand("%:r"))
		call append(line("."),"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G

"------------------------------plugin----------------------------------------
"ctags
set tags=tags;
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>

"taglist 插件Ctags 插件: TagList
let Tlist_Ctags_Cmd = '/usr/bin/ctags'   "设定Linux系统中ctags程序的位置
let Tlist_Show_One_File=1    "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1  "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
"let Tlist_Use_SingleClick= 1    "
"缺省情况下，在双击一个tag时，才会跳到该tag定义的位置
"let Tlist_Auto_Open=1    "在启动VIM后，自动打开taglist窗口
"let Tlist_Process_File_Always=1
""taglist始终解析文件中的tag，不管taglist窗口有没有打开
let Tlist_File_Fold_Auto_Close=1 "同时显示多个文件中的tag时，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来
"设置taglist打开关闭的快捷键F9
nnoremap <F9> :TlistToggle<CR>

"设置nerdtree的快捷键F8
nnoremap<F8> :NERDTreeToggle<CR>

"-- omnicppcomplete setting --代码自动补全C/C++
" 按下F3自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
"imap <F3> <C-X><C-O> o:omni
" 按下F2根据头文件内关键字补全
" imap <F2> <C-X><C-I> i:include
set completeopt=menu,menuone " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1

"-- Cscope setting --
if has("cscope")
	set csprg=/usr/bin/cscope " 指定用来执行cscope的命令
	set csto=0  "设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
	set cst " 同时搜索cscope数据库和标签文件
	set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
	set nocsverb
	if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim
		cs add cscope.out
	elseif $CSCOPE_DB != "" "否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
		cs add $CSCOPE_DB
	endif
	set csverb
endif

map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-, 然后很快再按下c）
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>

