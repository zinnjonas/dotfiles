" History of commands
set history=700

" Do indent and plugin stuff depending on filetype
filetype plugin on
filetype indent on

" Show line numbers
set number

" Set highlight
syntax on
" Colorscheme
colorscheme monokai
" set background=dark

" Show withspaces
set list

" Auto read files from disk if changed externaly
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
let g:mapleader=","

" Fast saving
nmap <leader>w :w!<CR>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" let backspace behave like it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search with ignore case
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros
set lazyredraw

" For regular expression turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink hen matching brackets
set mat=2
 
" A buffer becomes hidden when it is abandoned
set hid

" Set uft-8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Make some smart indentation
set cindent
" Indentation width = 2
set tabstop=2
set shiftwidth=2

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" After loading the vimrc and stuff
autocmd VimEnter * NERDTreeToggle
autocmd VimEnter * wincmd p
let g:nerdtree_tabs_open_on_console_startup = 1

" Tab navigation like Firefox.
nnoremap <F5> :tabprevious<CR>
nnoremap <F6> :tabnext<CR>
nnoremap <C-t> :tabnew 
nnoremap <C-Delete> :tabclose<CR>
inoremap <F5> <Esc>:tabprevious<CR>
inoremap <F6> <Esc>:tabnext<CR>
inoremap <C-t> <Esc>:tabnew 
inoremap <C-Delete> <Esc>:tabclose<CR>

" Return to last edit position when opening files
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" Remember info about open buffers on close
set viminfo^=%

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<CR>

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

" Allow c.vim to use doxygen and not cmake
let  g:C_UseTool_cmake    = 'no'
let  g:C_UseTool_doxygen = 'yes'

" Use F7 and F8 to traverse trough errors
map <silent> <F7> <Esc>:cprevious<CR>
map <silent> <F8> <Esc>:cnext<CR>

" Toggle line numbers
nmap <F10> <Esc>:ToggleNumber<CR>
nmap <F9> :A<CR>
imap <F9> <Esc>:A<CR>i


" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Do not give anyfeedback
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Stuff for the syntactics plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=None
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Settings for the airline plugin XD
"
" Use airline auch in the tabline
let g:airline#extensions#tabline#enabled = 1

" Do not change the layout of tmux all time
let g:airline#extensions#tmuxline#enabled = 0

" Configure Tmux statusline like the one from vim (airline)
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}

" Tmux statusline seperators
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

let g:airline_left_sep=''
let g:airline_right_sep=''

" Use todo#complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#complete

" Auto complete projects
au filetype todo imap <buffer> + +<C-X><C-O>

" Auto complete contexts
au filetype todo imap <buffer> @ @<C-X><C-O>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
 Plug 'junegunn/seoul256.vim'
 Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
 Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Nerd Tree
 Plug 'scrooloose/nerdtree'
 Plug 'jistr/vim-nerdtree-tabs'
 Plug 'Xuyuanp/nerdtree-git-plugin'

" Alternate files Plugin
 Plug 'vim-scripts/a.vim'

" C file plugin
 Plug 'vim-scripts/c.vim'

" Taglist plugin
 Plug 'vim-scripts/taglist.vim'

" CSS Color preview
 Plug 'ap/vim-css-color'

" Stuff for sh scripting
 Plug 'vim-scripts/sh.vim--Cla' 

" Using git URL
 Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Toggle linenumbers relative/absolute
 Plug 'vim-scripts/togglenumber'

 Plug 'KabbAmine/lazyList.vim' 

 " Monokai colorscheme
 Plug 'sickill/vim-monokai', { 'do': 'mkdir -p ~/.vim/colors/ && ln -fs ~/.vim/plugged/vim-monokai/colors/monokai.vim ~/.vim/colors/'}

 " Dependenices for cmake
 Plug 'scrooloose/syntastic'

 " Cmake plugin to generate folder
 "Plug 'jalcine/cmake.vim'
 Plug 'vhdirk/vim-cmake'

 " Vim Notes Plugin
 Plug 'xolox/vim-notes'
 " Dependencies
 Plug 'xolox/vim-misc'

 " Indentation guides
 Plug 'nathanaelkane/vim-indent-guides'

 " TODO list Plugin
 Plug 'vim-scripts/todo-txt.vim'

 " Airline plugin
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'

 " You complete me
 Plug 'Valloric/YouCompleteMe'

 " Tmux line same theme
 Plug 'edkolev/tmuxline.vim'

 " Prompt line
 Plug 'edkolev/promptline.vim'
 
call plug#end()

