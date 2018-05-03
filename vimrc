""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle - https://github.com/VundleVim/Vundle.vim
"
" installation command
"  git config --global core.autocrlf input
"  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"  inside vim -> :PluginInstall
"
" install new plugins
"  inside vim -> :PluginInstall
"
" Required
set nocompatible
filetype off
" Initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Required
Plugin 'VundleVim/Vundle.vim'
" Add Plugins here
Plugin 'scrooloose/nerdtree'              " file explorer
Plugin 'jistr/vim-nerdtree-tabs'          " nerdtree improved
Plugin 'mileszs/ack.vim'                  " search tool
Plugin 'altercation/vim-colors-solarized' " fancy colors :)
Plugin 'airblade/vim-gitgutter'           " git diff 
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'  "navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/syntastic'
Plugin 'tomasr/molokai'
Plugin 'danro/rename.vim'
Plugin 'tpope/vim-fugitive'
" Required
call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin - ack.vim
"
" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugin - Nerd Tree Tabs
"
" Auto Open Nerd Tree Tabs
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowHidden=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" set colorscheme
"
colorscheme molokai
let g:molokai_original = 1
"
" Plugin - Solarized
"
" PuTTy Window -> Colours
"  Default Foreground:      131, 148, 150
"  Default Bold Foreground: 147, 161, 161
"  Default Background:      0,   43   54
"  Default Bold Background: 7,   54,  66
"  Cursor Text:             0,   43,  54
"  Cursor Colour:           131, 148, 150
"  ANSI Black:              7,   54,  66
"  ANSI Black Bold:         0,   43,  54
"  ANSI Red:                220, 50,  47
"  ANSI Red Bold:           203, 75,  22
"  ANSI Green:              133, 153, 0
"  ANSI Green Bold:         88,  110, 117
"  ANSI Yellow:             181, 137, 0
"  ANSI Yellow Bold:        101, 123, 131
"  ANSI Blue:               38,  139, 210
"  ANSI Blue Bold:          131, 148, 150
"  ANSI Magenta:            211, 54,  130
"  ANSI Magenta Bold:       108, 113, 196
"  ANSI Cyan:               42,  161, 152
"  ANSI Cyan Bold:          147, 161, 161
"  ANSI White:              238, 232, 213
"  ANSI White Bold:         253, 246, 227
" Terminal only (Tested on Ubuntu 16.04 Server)
"set t_Co=16
"let g:solarized_termcolors=16
" Dark Solarized
"syntax enable
"set background=dark
"colorscheme solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Map Commands
"
" <Ctrl+a> Toggle NTT on all tabs
nnoremap <C-a> :NERDTreeTabsToggle<CR>
inoremap <C-a> <Esc>:NERDTreeTabsToggle<CR>
" <CTRL+t> New tab
nnoremap <C-t> :tabnew<CR><c-w><Left>
inoremap <C-t> <Esc>:tabnew<CR><c-w><Left>
" <CTRL+l> Previous tab
nnoremap <C-l> :tabnext<CR>
inoremap <C-l> <Esc>:tabnext<CR>
" <CTRL+h> Next tab
nnoremap <C-h> :tabprevious<CR>
inoremap <C-h> <Esc>:tabprevious<CR>

" Easier split navigations
" Instead of ctrl-w then j, it’s just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Quality of Life
"
" Interface
set nohlsearch " Turn off highlighting completely
set number          " Shows line numbers
set ruler           " Shows line and character position (lower right)
set showcmd         " Shows currently typed commands (lower right)
set wildmenu        " Shows completable commands when pressing <TAB> ex.
" Beeps and Flashes
set noerrorbells    " Disable beeping sound
set novisualbell    " Disable flashing screen part1
set t_vb=           " Disable flashing screen part2
" Command Timeouts
set notimeout       " Disable command timeout part1
set ttimeout        " Disable command timeout part2
" Debugging
"set list            " Add $ at the end of every line (for checking trailing whitespace)
" Safety First!
set confirm         " Executing :q without saving will show a confirm prompt
" Search
set hlsearch        " Search results will be highlighted
set ignorecase      " Case insensitive search
set incsearch       " Go to next match while typing search
set smartcase       " Searching with uppercase letters will make search case sensitive
" Speed
set lazyredraw      " Buffer screen updates (helpful in complex recordings)
" Tabs
set expandtab       " Pressing tab will use spaces instead
set shiftwidth=4    " Indentation spaces
set tabstop=4       " Determine how many spaces per tab
set updatetime=100  " git gutter response time 

" More natural split opening
" Open new split panes to right and bottom, which feels more natural than Vim’s default

set splitbelow
set splitright
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Commands
"
" :W sudo will force save a read-only file
command W w !sudo tee % > /dev/null
" Removes auto-indent when pasting (No more ':set paste'!)
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
