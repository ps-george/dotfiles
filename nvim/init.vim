" Remap leader to ,
let mapleader = "\\"

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

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
call plug#end()

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" Add nice symbols for lightline-ale
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

" " In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   'python': ['black'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_fix_on_save = 1
