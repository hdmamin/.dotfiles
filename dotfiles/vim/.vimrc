" Reload vimrc from this file with :source %

" Show line numbers
set number

" Current line has global number, other numbers are relative to that line.
set relativenumber

" Allow backspace to delete before the cursor when entering insertion mode with "i".
set backspace=indent,eol,start

" Set tab size to 4 spaces
set ts=4

" Expand tabs to spaces
set expandtab

" Number of spaces to delete when hitting backspace after a tab
set softtabstop=4
set tabstop=4

" Make indents using ">>" match tab indent size (4 spaces).
set shiftwidth=4

" Indent to next line when writing code
set autoindent

" Menu UI for filename autocomplete
set wildmenu

" Load language-specific indentation files automatically
filetype indent on

" Highlight search matches (incsearch updates after each typed letter).
set hlsearch
set incsearch

" Python syntax highlighting
let python_highlight_all = 1

" Vim-Plug plugins. Use command:
" :PlugInstall to install packages the first time, :PlugUpdate to update packages
" (This will only work if you've already called :source ~/.vimrc)
call plug#begin('~/.vim/plugged')
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-buftabline'
Plug '907th/vim-auto-save'
Plug 'tpope/vim-surround'   " Highlight text, then use S-char to surround w/ char.
Plug 'nelstrom/vim-visual-star-search'
Plug 'kalekundert/vim-coiled-snake'   " Better docstring folding.
Plug 'Konfekt/FastFold'
" Codex code completion. Disabled because I get an openai ImportError when
" opening vim even though openai is installed.
" Plug 'tom-doerr/vim_codex'
call plug#end()

" By default, fold docstrings but nothing else.
set foldlevel=1

" turn off rope due to freezing issue
let g:pymode_rope = 0

" Pylint config file
let g:pymode_options_max_line_length = 79 
let g:pymode_syntax_space_errors = 0
" (zR: open all, zM: close all, zo: open current, zc: close current)
let g:pymode_folding = 0
let g:pymode_folding_auto = 0
let g:pymode_lint_ignore = ["W391"]

" Make vim-buftabline show buffer numbers next to names.
let g:buftabline_numbers = 1

syntax enable

" Open file menu sidebar with \n
map <leader>n :NERDTreeToggle<CR>

" Use ctrl j/k to move lines down/up. Shift j/k causes problems in pycharm.
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Option-click allows cursor movement like in other text editors. 
" Top copy to clipboard, press fn key while highlighting text.
set mouse=a

" Underline the current line with dashes in normal mode
" Set this to f5 for a long time but that seemed to stop working on personal
" laptop, maybe after ventura update? Now set to ctrl + lowercase L (for
" "underLine; initially tried ctrl + u but that seems to do weird things to
" the undo command).
nnoremap <C-l> yyp<c-v>$r-

" Copy highlighted text to clipboard with '' (2 single quotes)
vmap '' :w !pbcopy<CR><CR>

" In command line mode, scroll through previous commands that start with the
" text typed so far. Usually this only works with arrow keys, but this lets us
" do it with ctrl-p (prev) and ctrl-n (next).
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" In command mode, lets us use %% to get current working directory, e.g. :e %%/newfile.txt
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Look for tags in file directory and work backwards to home directory.
set tags=./tags,tags;$HOME

" Dump whatever is copied to the default register (stuff you've yanked with y
" or yy) to /tmp/cp.txt. Useful when using vim in tmux on a remote vm.
" Call with ctrl+p in normal mode (recommended) or :Dump in command mode.
command! Dump call writefile([@"], "/tmp/cp.txt")
nnoremap <C-p> :Dump<CR>
