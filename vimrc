set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" fix for identation 
Plugin 'vim-scripts/indentpython.vim'
" to fix the folding - not everything should be folded
Plugin 'tmhedberg/SimpylFold'
" syntax checking and highlighting
Plugin 'scrooloose/syntastic'
" check for PEP8 compliancy
Plugin 'nvie/vim-flake8'
" best auto-complete plugin
Bundle 'Valloric/YouCompleteMe'
" color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99
" " Enable folding with the spacebar
nnoremap <space> za

" allows to see the docstrings for folded code
let g:SimpylFold_docstring_preview=1

" PEP8 standards for python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Flag unnecessary whitespaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

"python with virtualenv support - so cool!
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

" make sure we have the right color scheme based on vim mode:
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

" switch between dark and light scheme of Solarized using F5
"call togglebg#map("<F5>")

