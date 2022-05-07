"------------- DRAFT ----------------
nmap <F8> :TagbarToggle<CR>

compiler pyunit
set makeprg=python3\ %

"------------- MISC ----------------

" todo use LL and HH to jump forward backwards sueful for brakcets
set autochdir 

" overriding the comman from basic.vim. this avoids switching to new tab when opening from quickfxi window
set switchbuf=useopen

" what is this for?
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" search highlight color(only works for terminal launched vim)
hi Search cterm=NONE ctermfg=grey ctermbg=blue

" backspace in normal mode
:nnoremap <expr> <Backspace> col('.') == 1 ? 'kgJ' : 'X'

" line numbers 
set number

"------------- FONT ----------------

" TODO set font size at startup
set guifont=Menlo\ Regular:h16 
 
"------------- AUTOCOMMANDS ----------------
"autocmd BufRead,BufNewFile * start

"------------- PLUGINS ----------------

call vundle#begin()

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-unimpaired'
Plugin 'junegunn/fzf'
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()            " required

filetype plugin on    " required

"------------ SNIPPETS ------------------

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

cmap USE :UltiSnipsEdit

"------------- CLIPBOARD ----------------

set clipboard=unnamed

" add some pathes for search with :find

set path+=/Users/joelkropelin/.vim_runtime/
set path+=/Users/joelkropelin/vimfiles/

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

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

"" quick movements
"
"inoremap II <Esc>I
"inoremap AA <Esc>A
"inoremap OO <Esc>O
"
"" line modifications 
"
"inoremap CC <Esc>C
"inoremap SS <Esc>S
"inoremap DD <Esc>dd
"inoremap UU <Esc>u
"inoremap WW <C-w>
"inoremap PP <Esc>yypi
"inoremap EE <Esc>daWi 
"
"" line mods in command mode
"cnoremap WW <C-w>

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

" todo: test. bind K to grep word under cursor
nnoremap ** :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" configure the grep commmand (to skip the terminal mode and automatically show quickfix list for results)
command -nargs=+ -complete=file -bar Grep silent! grep! <args> |cwindow|redraw!

" map space space to Grep
nnoremap <space><space> :Grep<SPACE>

