" .vimrc file
" Belongs to: Warren Parsons

" ------------------------------------------------------------------------
" important
" ------------------------------------------------------------------------

set nocompatible

call pathogen#infect()					" run Pathogen

" Consolidate temp files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set fileencodings=utf-8					" Set file encoding

cd ~/Sites/								" Set starting directory

let mapleader = ","						" Set leader key to more convenient character

let g:netrw_liststyle=3					" Enable tree view in NETRW

" ------------------------------------------------------------------------
" moving around, searching and patterns
" ------------------------------------------------------------------------

set incsearch							" activate incremental search
set ignorecase smartcase				" make search case-insensitive

" Remap up and down movements to be visual up/down
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" Quicker cursor movement up and down
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Ack shortcut
nnoremap <LEADER>f :Ack!<space>

" ------------------------------------------------------------------------
" tags
" ------------------------------------------------------------------------

" Close Tags
let g:ragtag_global_maps = 1
imap df </<Plug>ragtagHtmlComplete

" ------------------------------------------------------------------------
" displaying text
" ------------------------------------------------------------------------

" Set wordwrap and line breaking
set wrap
set textwidth=79
set formatoptions=qrn1
set linebreak

set display=lastline					" Fix some scrolling issues

set number			" show line numbers
set numberwidth=6	" Make sure gutter maintains constant width

" Force highlighting for certain file types
au BufReadPost *.jsp set syntax=html
au BufReadPost *.jsp set filetype=html
au BufReadPost *.cshtml set syntax=html
au BufReadPost *.cshtml set filetype=html
au BufReadPost *.less set syntax=less
au BufReadPost *.less set filetype=less
au BufReadPost *.js set syntax=jquery

" ------------------------------------------------------------------------
" syntax, highlighting and spelling
" ------------------------------------------------------------------------

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery " Set jQuery syntax highlighting

syntax on								" syntax highlighting
filetype plugin indent on				" detect file types, etc.

set hlsearch		" Highlight all instances of search term
set cursorline		" highlight current line
set synmaxcol=300	" limit syntax highlighting on very long strings for performance


" ------------------------------------------------------------------------
" multiple windows
" ------------------------------------------------------------------------

set splitbelow		" Split vertical windows BELOW current window!
set splitright		" Split horizontal windows to RIGHT of current window

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ------------------------------------------------------------------------
" multiple tab pages
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" terminal
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" using the mouse
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" GUI
" ------------------------------------------------------------------------

set title       " set title to filename and modification status
set showmode    " show current mode (insert, visual, etc.)
set spell	" spellchecking on
set hidden	" allow buffer switching without saving

set guifont=Monaco:h13		" font preferences
set guioptions-=T

colorscheme candycode_wlp	" color scheme

set scrolloff=3		" always have at least 3 lines before the window's bottom

" Highlight background color when in insert mode
au InsertEnter * hi Normal guibg=#543210
"au InsertEnter * hi Normal guibg=#292b10
au InsertLeave * hi Normal guibg=#10212B

" Toggle relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Set relative line numbers at startup
set relativenumber

" Activate/deactivate relative line numbering when entering/leaving Insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Activate/deactivate relative line numbering based on app focus
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" ------------------------------------------------------------------------
" printing
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" messages and info
" ------------------------------------------------------------------------

set showcmd			" Show current command in status bar
set ruler			" line numbers, rulers, and everything else

" ------------------------------------------------------------------------
" selecting text
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" editing text
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" tabs and indenting
" ------------------------------------------------------------------------

set noet sts=0 sw=4 ts=4				" Set tab options

set cindent
set cinoptions=(0,u0,U0)

" ------------------------------------------------------------------------
" folding
" ------------------------------------------------------------------------

" Folds - save and load when files are opened and closed
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

" ------------------------------------------------------------------------
" diff mode
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" mapping
" ------------------------------------------------------------------------

set timeoutlen=450	" Set command timeout

map <LEADER>v :e ~/.vimrc<CR>

inoremap jk <esc>
inoremap kj <esc>

" Ctrl-P invocation
map <LEADER>t :CtrlP<cr>
map <LEADER>b :CtrlPBuffer<cr>

" insert space with spacebar from Normal mode
nnoremap <space> a<space><esc>

" remove search highlighting
nnoremap <silent> <LEADER>l :nohl<CR><C-l>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

" Shortcut for YankRing (multiple clipboards)
nnoremap <silent> <F11> :YRShow<CR>

" Quick buffer access
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" map Google search
map © <ESC>:! /usr/bin/open -a "/Applications/Google Chrome.app" 'https://google.com/search?q=<C-R>=Terms()<CR>'<CR><CR>

nmap <LEADER>' :call SynStack()<cr>

" ------------------------------------------------------------------------
" reading and writing files
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" command line editing
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" executing external commands
" ------------------------------------------------------------------------

" Docksend - Custom command saves file before sending
map <S-U> :silent w! <bar> DockSend<CR>
" Docksend - Without saving for binary files
map <C-S-U> :DockSend<CR>

" Launch Google search in Chrome by typing Alt+g
function! Terms()
  call inputsave()
  let searchterm = input('Search: ')
  call inputrestore()
  return searchterm
endfunction

" ------------------------------------------------------------------------
" language specific
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" multi-byte characters
" ------------------------------------------------------------------------

" ------------------------------------------------------------------------
" various
" ------------------------------------------------------------------------
let g:startify_unlisted_buffer = 0

" ------------------------------------------------------------------------
" functions
" ------------------------------------------------------------------------

" Convert text to HTML by escaping <, >, ", and &.
function! HtmlizeText()
    let line = getline(".")
    let line = substitute(line, '&', '\&amp;', 'g')
    let line = substitute(line, '“', '\&#x201c;', 'g')
    let line = substitute(line, '”', '\&#x201d;', 'g')
    let line = substitute(line, '®', '\&reg;', 'g')
    let line = substitute(line, '™', '\&trade;', 'g')
    call setline(".", line)
endfunction

function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

""""""""""""""""""""""""""""""""""""""
"          Startup Config			 "
""""""""""""""""""""""""""""""""""""""
set matchpairs+=<:>						" Define matching pairs

set nrformats=hex

" Increase history states past default
set history=500
set undolevels=500

" Gundo settings
let g:gundo_close_on_revert = 1
let g:gundo_preview_bottom = 1
let g:gundo_right = 1


""""""""""""""""""""""""""""""""""""""
"            Mappings				 "
""""""""""""""""""""""""""""""""""""""





" Easy buffer navigation
nnoremap <F5> :buffers<CR>:buffer<Space>

" Set trigger for Gundo
nnoremap <F6> :GundoToggle<CR>

" Dummy-proof buffer deletion, leaves window layout untouched
nnoremap <LEADER>w :BD<CR>

" Remap :join since we usurped its shortcut
nnoremap <LEADER>j :join<CR>

" Split a line at the cursor
nmap <silent> <leader>s a<CR><ESC>

" Set nowrap with keyboard shortcut to wrap temporarily
noremap <LEADER>r :set nowrap!<CR>

" Increase scrolling speed to 3 lines at a time
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


" Shortcut for converting image URL on clipboard to base64
command B64 :call Img2Data()<CR>

" Ctrl-P - set to use cwd
let g:ctrlp_working_path_mode = '0'
" let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag']

" Exclude certain items from Command-T results
let g:CommandTNeverShowDotFiles = 1
set wildignore+=**/CVS/** " CVS files
set wildignore+=*.swf,*.mp4,*.flv,*.wmv,*.ogv,*.ttf,*.eot,*.doc,*.docx,*.xls,*.pdf,*.fla " various binary files
set wildignore+=*.png~ " optimized PNGs left on the file system
set wildignore+=**/showroomeventgallery/** " some Delta images

set wildmode=list:longest


runtime macros/matchit.vim

" Command to convert leading spaces to tabs
command! -range=% -nargs=0 FixTabs execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" Autocompletions/spelling corrections
iab teh the
iab Teh The
iab nbh &#x2011;

command Htmlize :call HtmlizeText()<CR>
