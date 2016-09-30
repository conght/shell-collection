let mapleader=";"
colo molokai
set number
set autoindent
set smartindent
set showmatch
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set nobackup
set guifont=Ubuntu\ Mono\ 13
"set guifont=YaHei\ Consolas\ Hybrid\ 12
set formatoptions=tcqmM
set tw=80
set laststatus=2
set ruler
set cursorline
set cursorcolumn
set hlsearch
"set nowrap
syntax enable
syntax on
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

nmap <silent> <Leader>sw :FSHere<cr>

let g:Powerline_colorscheme='solarized256'

map <f5> <esc>:%! astyle -p -f -H -U --style=ansi --indent=spaces=4<cr>

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS—Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/OmniCppComplete'
"Plugin 'scrooloose/syntastic'
" 插件列表结束
call vundle#end()
filetype plugin indent on

autocmd BufWritePost $MYVIMRC source $MYVIMRC
