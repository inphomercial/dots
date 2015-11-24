
" Vundle Package Manager #########

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'                        " Main Package Manager
Plugin 'git@github.com:scrooloose/nerdtree.git'   " File Explorer windo w
Plugin 'ctrlp.vim'                                " Quick file finder/search
Plugin 'airblade/vim-gitgutter'                   " GIT Gutter
Plugin 'tComment'
Plugin 'bling/vim-bufferline'
Plugin 'itchyny/lightline.vim'                    " Pretty file bar
Plugin 'beyondwords/vim-twig'                     " Twig highlighting

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""

" Turn on syntax highlighting
syntax on

" Set color scheme
colo lucius
LuciusDarkLowContrast

" Define whitespace
hi ExtraWhitespace             ctermfg=161
hi CursorLineNr                ctermfg=yellow
hi LineNr                      ctermbg=none

" Match on extra white space
match ExtraWhitespace /\s\+\%#\@<!$/

" Column lines
set colorcolumn=120                      " visual column length
set list                                 " display special characters
set listchars=tab:>\ ,eol:-,trail:.      " special characters for special char

" Reload files changed outside vim
set autoread

" Display the cursor position on the last line of the scrren or status line;
set ruler

" Lightlinevim. Initalizer
set laststatus=2

" Allows for pre-saved buffer changes
set hidden

" Show line numbers
set number

" Set tab title
set title

" Highlights gutter line number and shows current line
set cursorline

" Shows the $ at the end of the word you are editing
set cpoptions+=$

" Highlight Searches
set hlsearch

" Ignore case for searching
set ignorecase

" do case-sensitive if there is a capital letter
set smartcase

" Wild Menu (shows available commands)
set wildmode=list:longest
set wildmenu
set wildignore=*.png,*.jpg,*.gif
set wildignore+=*DS_Store*

" Tab control, convert to spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" set focus on cursorline for active buffer
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" exit insert mode within insert mode
inoremap jj <Esc>

" colon, semi-colon switch
nnoremap ; :
" Clear trailing white spaces
nnoremap <leader>w :call <SID>StripTrailingWhitespaces()<CR>

" Key Bindings
let mapleader = "\<space>"
map <Leader>n :NERDTreeToggle<CR>
map <Leader>j :bp<CR>
map <Leader>k :bn<CR>
map <Leader>s :source $MYVIMRC<CR>

"FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")

    " Work: match extra whitespace
    %s/\s\+$//e

    " Cleanup: restore previous search history and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

