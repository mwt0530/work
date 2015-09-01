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
filetype plugin indent on


"设置（软）制表符宽度为4：
set tabstop=4
set softtabstop=4
"设置缩进的空格数为4
set shiftwidth=4
"设置自动缩进：即每行的缩进值与上一行相等；使用 noautoindent 取消设置：
set autoindent
"设置使用 C/C++ 语言的自动缩进方式：
set cindent

"ctags
set tags=tags;
set autochdir

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
noremap <F9> :TlistToggle<CR>

"nerdtree
nnoremap<F8> :NERDTreeToggle<CR>
