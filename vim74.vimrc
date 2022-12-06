" vim 无插件配置
" 显示设置 display
syntax enable
" set termguicolors
set t_Co=256
colorscheme pablo
" 高亮当前行
set cursorline
highlight CursorLine   cterm=NONE ctermbg=237 ctermfg=NONE guibg=NONE guifg=NONE
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE
" highlight clear comment
" highlight comment cterm=italic ctermfg=8
" highlight Pmenu ctermbg=DarkMagenta
" mitty cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
" 换行中保留完整的单词
set formatoptions=l
set lbr
set number
" 总是显示状态行
set laststatus=2

" 快捷键设置 keymap
nnoremap <esc><esc> :noh<return><esc>
nnoremap <F3> :E<CR>
nmap w- :resize -3<CR>
nmap w= :resize +3<CR>
nmap w, :vertical resize -3<CR>
nmap w. :vertical resize +3<CR>

" 行为设置 operation
" 共享系统粘贴板
set clipboard=unnamedplus,unnamed
" 搜索相关
set hlsearch incsearch ignorecase
" 操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠。zf手动折叠
" 基于缩进或语法进行代码折叠
" set foldmethod=indent OR set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
set mouse=a
"Switch buffers without save
set hidden
" 自动关闭netrw
let g:netrw_browse_split = 0

" 设置拼写检查
" set spell
" set spelllang=en
" set spelllang+=cjk
" hi clear SpellBad 
" hi clear SpellCap 
" hi SpellBad  ctermbg=236
" hi SpellCap  ctermbg=236

" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When this option is enabled, vi will use spaces instead of tabs
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" 推荐安装这个插件 AutoComplPop https://www.vim.org/scripts/script.php?script_id=1879