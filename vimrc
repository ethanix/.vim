" Address: $HOME/.vim/vimrc
" Date: Mon Feb 3 CST 2020

" ===
" Essential Settings
" ===
set encoding=utf-8

set langmenu=en_US.UTF-8

set nocompatible

set updatetime=1000

set timeoutlen=500

set autowrite

set autoread

set list

set textwidth=80

set tabstop=4

set expandtab

set autoindent

set shiftwidth=4

set softtabstop=4

set listchars=tab:▶\ ,trail:●

set cursorline

set number

set relativenumber

set wrap

set scrolloff=3

set ruler

set cmdheight=1

set laststatus=2

set autochdir

set formatoptions-=tc

set showcmd

set showmode

set wildmenu

set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc

set wildmode=longest,list,full

set nobackup

set nowritebackup

set noswapfile

let mapleader=' '

let &t_SR = "\<Esc>]50;CursorShape=2\x7"

let &t_EI = "\<Esc>]50;CursorShape=0\x7"

syntax on

syntax enable

augroup mine | autocmd FocusLost * :wa

map <LEADER><LEADER> :w<CR>:e ~/.vim/vimrc<CR>

map <LEADER>r :w<CR>:source ~/.vim/vimrc<CR>

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set hlsearch

set incsearch

set ignorecase

set smartcase

exec 'nohlsearch'

noremap <LEADER><CR> :nohlsearch<CR>

filetype on

filetype indent on

filetype plugin on

filetype plugin indent on

augroup mine | autocmd BufRead,BufNewFile *.m   set filetype=m
augroup mine | autocmd BufRead,BufNewFile *.tex set filetype=tex


" ===
" Window Splitting
" ===
set splitright
set splitbelow
nnoremap z\ :vs<CR>
nnoremap z- :sp<CR>
nnoremap t- :ter<CR>
nnoremap t\ :vert term<CR>
tnoremap <c-[> <c-w>:ter<CR>
tnoremap <c-\> <c-w>:vert term<CR>
nnoremap zj <c-w>j
nnoremap zk <c-w>k
nnoremap zh <c-w>h
nnoremap zl <c-w>l
nnoremap zq <c-w>c
nnoremap > <c-w>><c-w>><
nnoremap < <c-w><<c-w><<c-w><
nnoremap = <c-w>+<c-w>+<c-w>+
nnoremap - <c-w>-<c-w>-<c-w>-
nnoremap + <c-w>=


" ===
" CompileRunGcc
" ===
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec 'w'
  if &filetype ==# 'sh'
    silent! exec '!clear'
    :!time bash %
  elseif &filetype ==# 'c'
    silent! exec '!clear'
    exec '!g++ % -o %<'
    exec '!time ./%<'
  elseif &filetype ==# 'cpp'
    silent! exec '!clear'
    exec '!g++ % -o %<'
    exec '!time ./%<'
  elseif &filetype ==# 'python'
    silent! exec '!clear'
    exec '!time python3 %'
  elseif &filetype ==# 'html'
    exec '!chromium % &'
  endif
endfunc


" ===
" Plugins
" ===
call plug#begin('~/.vim/plugged')

" a nice theme
Plug 'morhetz/gruvbox'

" status bar
Plug 'vim-airline/vim-airline'

" status bar theme
Plug 'vim-airline/vim-airline-themes'

" multiple cursors
Plug 'terryma/vim-multiple-cursors'

" selected words highliht
Plug 'lfv89/vim-interestingwords'

" hyperlink
Plug 'amix/open_file_under_cursor.vim'

" indent
Plug 'Yggdroot/indentLine'

" chromatic brackets
Plug 'frazrepo/vim-rainbow'

" homepage
Plug 'mhinz/vim-startify'
call plug#end()


" ===
" Suggestions for mapping
" ===
" Because of the unavoidable delay derived from vim's reaction, if you wanna work on vim smoothly, you'd better see something below:

" 1. a(append)  i(insert)    o(new line)  r(replace)   v(visual mode)
"       s(swap)    p(paste)     y(copy)      f(find)      d(delete)
"       x(delete)  b(backward)  w(forward)   h(left)      l(right)
"       j(down)    k(up)        n(next)      /(command)   .(delete)
"    All of them are not suitable for shortcut combination because of the
"    inevitable delay.

" 2. c(change) can be used for mapping but pay attention to 'ci*','cw*'...

" 3. q(quit) can be used for mapping but pay attention to 'ci*','cw*'...

" 4. z m t g [ ] ; ' \ , are available for that.


" ===
" vim-interestingwords
" ===
let g:interestingWordsRandomiseColors = 1
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
nnoremap <silent> <leader>k :call InterestingWords('n')<CR>
nnoremap <silent> <leader>K :call UncolorAllWords()<CR>
noremap <silent>n n :call WordNavigation('forward')<CR>
nnoremap <silent> N :call WordNavigation('backward')<CR>


" ===
" vim-airline
" ===
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
noremap <c-j> :bp<CR>
noremap <c-J> :bn<CR>
noremap qq :Bdelete<CR>


" ===
" vim-airline-themes
" ===
" AirLineTheme: dark soda luna
augroup mine | autocmd VimEnter * AirlineTheme soda
let g:lightline = {
      \     'active': {
      \     'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
      \     'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
      \     }
      \ }


" ===
" indentLine
" ===
let g:indentLine_color_gui = '#ED6824'
let g:indentLine_char_list = ['¦', '┆', '┊','╏','┇','┋','│','┃','║']


" ===
" vim-rainbow
" ===
augroup mine | autocmd FileType * call rainbow#load()
let g:rainbow_active = 1
let g:rainbow_load_separately = [
      \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
      \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
      \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
      \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
      \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


" ===
" vim-multiple-cursors
" ===
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<c-k>'
let g:multi_cursor_next_key            = '<c-n>'
let g:multi_cursor_prev_key            = '<c-l>'
let g:multi_cursor_skip_key            = '<c-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" ===
" gruvbox
" ===
colorscheme gruvbox
set background=dark
" Transparent:
" highlight Normal guibg=NONE ctermbg=None


" ===
" File Header
" ===
func FileHeader()

  if &filetype ==# 'sh'
    call setline(1,'#! /bin/bash')
  endif

endfunc
autocmd BufNewFile * exec ":call FileHeader()"


source ~/.vim/shortcut.vim
