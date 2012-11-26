" .vimrc file
" Belongs to: Warren Parsons

set nocompatible

""""""""""""""""""""""""""""""""""""""
"            Appearance              "
""""""""""""""""""""""""""""""""""""""
set guifont=Monaco:h13					" font preferences
colorscheme candycode_wlp				" color scheme
set ruler								" line numbers, rulers, and everything else
set number								" show line numbers
set numberwidth=6						" Make sure gutter maintains constant width for abs/relative numbering
set scrolloff=3							" always have at least 3 lines before the window's bottom
set hlsearch							" Highlight all instances of search term
set cursorline							" highlight current line
set splitbelow							" Split vertical windows BELOW current window!
set splitright							" Split horizontal windows to RIGHT of current window
set synmaxcol=300						" limit syntax highlighting on very long strings to improve performance
set showcmd								" Show current command in status bar
set timeoutlen=350						" Set command timeout
set guioptions-=T

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery " Set jQuery syntax highlighting


call pathogen#infect()					" run Pathogen
syntax on								" syntax highlighting
filetype plugin indent on				" detect file types, etc.
autocmd vimenter * NERDTree | wincmd p	" autoload NERDTree
let g:NERDTreeWinSize = 40				" set NerdTree width

" Automatically remove trailing whitespace on save
" autocmd FileType html,js,css,jsp autocmd BufWritePre <buffer> :%s/\s\+$//e

let mapleader = ","						" Set leader key to more convenient character


""""""""""""""""""""""""""""""""""""""
"          Startup Config			 "
""""""""""""""""""""""""""""""""""""""
cd ~/Sites/								" Set starting directory
set fileencodings=utf-8					" Set file encoding
set smartcase							" Make searches easier
set matchpairs+=<:>						" Define matching pairs
set noet sts=0 sw=4 ts=4				" Set tab options
set cindent
set cinoptions=(0,u0,U0)

set incsearch							" activate incremental search
set ignorecase smartcase				" make search case-insensitive
set display=lastline					" Fix some scrolling issues

set nrformats=hex

" Consolidate temp files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Force highlighting for certain file types
au BufReadPost *.jsp set syntax=html
au BufReadPost *.jsp set filetype=html
au BufReadPost *.cshtml set syntax=html
au BufReadPost *.cshtml set filetype=html
au BufReadPost *.less set syntax=less
au BufReadPost *.less set filetype=less
au BufReadPost *.js set syntax=jquery

" MiniBufExplorer - Position at top
" let g:miniBufExplSplitBelow=0

" Set wordwrap and line breaking
set wrap
set linebreak

" --interface appearance
set title       " set title to filename and modification status
set showmode    " show current mode (insert, visual, etc.)
set spell	" spellchecking on
set hidden	" allow buffer switching without saving

" Increase history states past default
set history=500
set undolevels=500

" Gundo settings
let g:gundo_close_on_revert = 1
let g:gundo_preview_bottom = 1
let g:gundo_right = 1

" Folds - save and load when files are opened and closed
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

""""""""""""""""""""""""""""""""""""""
"            Mappings				 "
""""""""""""""""""""""""""""""""""""""

" Key Remapping
map <F1> :NERDTreeToggle<CR>

" Docksend - Custom command saves file before sending
map <S-U> :silent w! <bar> DockSend<CR>
" Docksend - Without saving for binary files
map <C-S-U> :DockSend<CR>

map <LEADER>v :e ~/.vimrc<CR>
map <D-r> :NERDTreeFind<CR>

" Ack shortcut
nnoremap <LEADER>f :Ack!<space>

inoremap jk <esc>
inoremap kj <esc>

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

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Easier bracket matching
nnoremap <tab> %

" Easy indent/unindent
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Set nowrap with keyboard shortcut to wrap temporarily
noremap <LEADER>r :set nowrap!<CR>

" Increase scrolling speed to 3 lines at a time
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Quick buffer access
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
"nnoremap <Leader>f :bn<CR>
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

" Make : entry easier
"nnoremap ; :

" Shortcut for converting image URL on clipboard to base64
command B64 :call Img2Data()<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <LEADER>l :nohl<CR><C-l>

" Shortcut for YankRing (multiple clipboards)
nnoremap <silent> <F11> :YRShow<CR>

" Exclude certain items from file browser
let NERDTreeIgnore=['CVS$[[dir]]']

nnoremap <space> a<space><esc>


" Exclude certain items from Command-T results
let g:CommandTNeverShowDotFiles = 1
set wildignore+=**/CVS/** " CVS files
set wildignore+=*.swf,*.mp4,*.flv,*.wmv,*.ogv,*.ttf,*.eot,*.doc,*.docx,*.xls,*.pdf,*.fla " various binary files
set wildignore+=*.png~ " optimized PNGs left on the filesystem
set wildignore+=**/showroomeventgallery/** " some Delta images

set wildmode=list:longest


" set scrolloff=3

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

runtime macros/matchit.vim

" Toggle relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Set relative line numbers at startup
set relativenumber

" Activate/deactivate relative line numbering when entering/leaving Insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Activate/deactivate relative line numbering based on app focus
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Launch Google search in Chrome by typing Alt+g
function! Terms()
  call inputsave()
  let searchterm = input('Search: ')
  call inputrestore()
  return searchterm
endfunction
map © <ESC>:! /usr/bin/open -a "/Applications/Google Chrome.app" 'https://google.com/search?q=<C-R>=Terms()<CR>'<CR><CR>


" Close Tags
let g:ragtag_global_maps = 1
imap df </<Plug>ragtagHtmlComplete<DEL>

" Highlight background color when in insert mode
au InsertEnter * hi Normal guibg=#292b10
au InsertLeave * hi Normal guibg=#10212B

" Command to convert leading spaces to tabs
command! -range=% -nargs=0 FixTabs execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" Command to base64 convert an image
" map <F2> :!cat <C-r>% \| openssl base64 \| tr -d '\n' \| pbcopy<CR>
" map <F6> data:image/png;base64, pbpaste

" Autocompletions/spelling corrections
iab teh the
iab Teh The
iab nbh &#x2011;

" ------------------------------------------------------------------
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

nmap <LEADER>h :call HtmlizeText()<cr>
vmap <LEADER>h :call HtmlizeText()<cr>

function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap <LEADER>' :call SynStack()<cr>

"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
"highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
"use :set list! to toggle visible whitespace on/off
"set listchars=tab:>-,trail:.,extends:>
set listchars=tab:▶\ 
set listchars+=trail:◂
set listchars+=extends:❯
set listchars+=precedes:❮

" clear trailing whitespace
nnoremap <LEADER>c :%s/\s\+$//e<CR>
