set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'tpope/vim-unimpaired'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" add some pathes for search with :find
set path+=/Users/joelkropelin/.vim_runtime/
set path+=/Users/joelkropelin/vimfiles/

" move quickly through paragraphs
map <CR> :
map ö }
map ä {

" shortcut for file path completion (c-x c-f)
inoremap <tab> <C-x><C-f>
inoremap <up> <C-p>
inoremap <down> <C-n>

" move among buffers with SHIFT
map <S-J> :bnext<CR>
map <S-K> :bprev<CR>
map <S-X> :bd<CR>

" vim markdown options
set conceallevel=2
let g:vim_markdown_toc_autofit = 1
set foldenable

" move line or visual up and down with option jk
nnoremap º :m .+1<CR>==
nnoremap ∆ :m .-2<CR>==
inoremap º <Esc>:m .+1<CR>==gi
inoremap ∆ <Esc>:m .-2<CR>==gi
vnoremap º :m '>+1<CR>gv=gv
vnoremap ∆ :m '<-2<CR>gv=gv

" quick movements
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O

" line modifications 
inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap DD <Esc>dd
inoremap UU <Esc>u
inoremap WW <C-w>
cnoremap WW <C-w>
inoremap PP <Esc>yypi
