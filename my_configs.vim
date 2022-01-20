" todos list:
" todo new line auto tab is annoying
" todo go to last cursor position when switching buffers (this does not work for my_configs.vim)
" todo: make ag search more flexible (currently it has predefined search directories)

"------------- DRAFT ----------------

" todo use LL and HH to jump forward backwards sueful for brakcets


"------------- MISC ----------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim

" search highlight color(only works for terminal launched vim)
hi Search cterm=NONE ctermfg=grey ctermbg=blue

" backspace in normal mode
:nnoremap <expr> <Backspace> col('.') == 1 ? 'kgJ' : 'X'

"------------- PLUGINS ----------------

call vundle#begin()

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-unimpaired'
Plugin 'junegunn/fzf'
Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required

filetype plugin on    " required

"------------- CLIPBOARD ----------------

set clipboard=unnamed

" add some pathes for search with :find

set path+=/Users/joelkropelin/.vim_runtime/
set path+=/Users/joelkropelin/vimfiles/

" move quickly through paragraphs

nnoremap <CR> :
nnoremap ö }
nnoremap ä {

" shortcut for file path completion (c-x c-f)
" bug this is annoying in markdown when trying to indent with tab
" add option + tab mapping?
" inoremap <r-tab> <C-x><C-f>

inoremap <up> <C-p>
inoremap <down> <C-n>

" move among buffers with SHIFT

map <S-J> :bnext<CR>
map <S-K> :bprev<CR>
map <S-X> :bd<CR>

"------------- MARKDOWN ----------------
" vim markdown options

set conceallevel=2
let g:vim_markdown_toc_autofit = 1
set foldenable

" markdown bold (opt-b), italic (opt-i)
" howto: use option-b for bold map 8747 key to ** :echo char2nr("∫") -> 8747 

let b:surround_8260 = "**\r**" "this maps opt-i
let b:surround_8747 = "**\r**" "this maps opt-b

"------------- TEXT STRUCTURING ----------------

" move line or visual up and down with option jk

nnoremap º :m .+1<CR>==
nnoremap ∆ :m .-2<CR>==
inoremap º <Esc>:m .+1<CR>==gi
inoremap ∆ <Esc>:m .-2<CR>==gi
vnoremap º :m '>+1<CR>gv=gv
vnoremap ∆ :m '<-2<CR>gv=gv

" todo move line or visual up or down with option öä
" todo move line or visual up or down with option gg/G

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
inoremap PP <Esc>yypi
inoremap EE <Esc>daWi 

" line mods in command mode
cnoremap WW <C-w>

"------------- SEARCH ----------------

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap ** :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
"command -nargs=+ -complete=file -bar Ag silent! grep! <args> .vim_runtime/|cwindow|redraw!
command -nargs=+ -complete=file -bar Ag silent! grep! <args> .vim_runtime/my_configs.vim .vim_runtime/vimrcs/ vimfiles/|cwindow|redraw!

" map space space for text search in above specified files 
nnoremap <space><space> :Ag<SPACE>

" move through quickfix window
nnoremap Ö :cnext<CR>
nnoremap Ä :cprev<CR>

" close the quickfix window
nnoremap Ü :ccl<CR>
nnoremap ÜÜ :copen<CR>

