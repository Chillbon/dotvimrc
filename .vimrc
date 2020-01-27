" #### ~/.vimrc

call plug#begin('~/.vim/bundle')

" theme
Plug 'morhetz/gruvbox'

" Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/LeaderF'
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'nathanaelkane/vim-indent-guides'

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'

Plug 'Valloric/YouCompleteMe'

call plug#end()
filetype plugin indent on

set nocompatible
set backspace=indent,eol,start

" 配色方案
colorscheme gruvbox
" colorscheme molokai
" colorscheme solarized
set background=dark
set t_Co=256

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T" 

" 总是显示状态栏
set laststatus=2
" 设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double

" theme
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
let g:airline_theme="bubblegum"
" 开启tabline
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1

" powerline font
"set guifont=Source_Code_Pro_for_Powerline:h14:cANSI
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
" set cursorline
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set nowrap

" 设置状态栏主题风格
" let g:Powerline_colorscheme='solarized256'
" let g:Powerline_symbols = 'fancy'
" set t_Co=256

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 设置编码方式
set encoding=utf-8
" 设置打开文件的编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.UTF-8
set fileencoding=utf-8
set fileencodings=utf-8
set helplang=cn 

" use UNIX as the standard file type
set ffs=unix,dos,mac

" 合并两行中文时，不在中间加空格：
set formatoptions+=B

" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前Vim模式
set showmode
" 设置代码匹配,包括括号匹配情况
set showmatch

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
" set softtabstop=4

" 设置C/C++方式自动对齐
set autoindent
set cindent
set smartindent

" #### tab
" 使用Backspace直接删除tab
" set smarttab

" 不在单词中间折行
set lbr

set noswapfile
set nobackup

set clipboard=unnamed

" 设置在Vim中可以使用鼠标，防止终端无法拷贝  
set mouse=a

" 文件修改之后自动读入
set autoread

" #### search
" 开启及时搜索(is)  
set incsearch  
" 设置搜索高亮(hlsearch)  
set hls  
" 设置搜索时忽略大小写  
set ignorecase  
" 当搜索的时候尝试smart  
set smartcase

" 随 vim 自启动
" let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
" let g:indent_guides_start_level=2
" 色块宽度
" let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
" :nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" gtags
set cscopetag " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
"gtags.vim 设置项
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

" ctags
set tags=./.tags;,.tags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
set statusline+=%{gutentags#statusline()}
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" leaderf
noremap <F7> :LeaderfFunction!<cr>
" noremap <m-m> :LeaderfTag<cr>
let g:Lf_ShortcutF = '<c-p>'
" let g:Lf_ShortcutB = '<m-n>'

" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "Source Code Pro for Powerline" }
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function': 1, 'BufTag': 0 }

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：Ctrl+n
map <C-n> :NERDTreeToggle<CR>
augroup NERDTree
    au!
    " autocmd vimenter * NERDTree     " vim启动时自动打开NERDTree
    " vim启动打开目录时自动打开NERDTree
    " autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * if (argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")) | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    "  当不带参数打开vim时，自动加载项目树
    " autocmd VimEnter * if (argc() == 0 && !exists("s:std_in")) | NERDTree | endif
    " 文件全部关闭时退出NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
" 不显示这些文件
" let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules']
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.egg$', '^\.git$', '^\.repo$', '^\.svn$', '^\.hg$' ]
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=40
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=0
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
let NERDTreeHighlightCursorline = 1       " 高亮当前行
let NERDTreeShowLineNumbers     = 1       " 显示行号
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '☒',
"     \ "Unknown"   : "?"
"     \ }

" ##### YouCompleteMe Configure
let g:ycm_server_python_interpreter='python3'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

" 字符补全
let g:ycm_min_num_of_chars_for_completion=2             " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_autoclose_preview_window_after_completion=1       " 智能关闭自动补全窗口
let g:ycm_complete_in_strings=1

" 屏蔽 YCM 的诊断信息, 后续可以用ale替代
" let g:ycm_show_diagnostics_ui = 0

autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    " 回车即选中补全菜单中的当前项
" let g:ycm_key_list_stop_completion = ['<C-y>']                  " Default   

" 手工出发语义补全
" let g:ycm_key_invoke_completion = '<c-z>'

" 只需要输入符号的两个字母，即可自动弹出语义补全
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

" 开启各种补全引擎
let g:ycm_collect_identifiers_from_tags_files=1         " 开启 YCM 基于标签引擎
let g:ycm_auto_trigger = 1                  " 开启 YCM 基于标识符补全，默认为1
let g:ycm_seed_identifiers_with_syntax=1                " 开启 YCM 基于语法关键字补全
let g:ycm_complete_in_comments = 1              " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1               " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 " 注释和字符串中的文字也会被收入补全

let g:ycm_confirm_extra_conf=0                  " 关闭加载.ycm_extra_conf.py确认提示
let g:ycm_filetype_whitelist = { 
            \ "c":1,
            \ "cpp":1,
            \ "objc":1,
            \ "go":1,
            \ "Java": 1,
            \ "python":1,
            \ "sh":1,
            \ "zsh":1,
            \ "vim":1,
            \ }
let g:ycm_filetype_blacklist = {
        \ 'markdown' : 1,
        \ 'text' : 1,
        \ 'pandoc' : 1,
        \ 'infolog' : 1,
        \}

