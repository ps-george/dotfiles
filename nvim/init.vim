call plug#begin('~/.vim/plugged')
Plug 'nvie/vim-flake8'
call plug#end()

" call Flake8 on file save
autocmd BufWritePost *.py call flake8#Flake8()
autocmd Filetype python setlocal ts=4 sts=4 sw=4

syntax enable " enable syntax processing
set relativenumber " show line numbers
set number

" Enumerate filetypes you want to highlight in code block in markdown.
" Please be careful because too many items in the list will make highlighting markdown slow.
let g:markdown_fenced_languages = ['sql', 'python']

" Relative or absolute number lines
function! NumberToggle()
    set nu!
    set rnu!
endfunction

nnoremap <C-n> :call NumberToggle()<CR>

" insert date on F9 press
nnoremap <F9> "=strftime("%a %d %b %Y")<CR>P
inoremap <F9> <C-R>=strftime("%a %d %b %Y")<CR>

" General tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" Persistent undo even after you close a file and re-open it
set undofile

set wildmenu " visual autocomplete for command menu
set showmatch " highlights matching brackets

set incsearch " search as characters are entered
" set hlsearch  " highlight matches

" move vertically by visual line
" nnoremap j gj
" nnoremap k gk

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
