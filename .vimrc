
" create backupdir
if !isdirectory("~/.vim/backupdir")
    silent! execute "!mkdir -p ~/.vim/backupdir"
endif
set backup backupext=.bak backupdir=~/.vim/backupdir
set patchmode=.orig

" enable syntax highlighting
syntax on

" enable file type detection and plugin/indent info
filetype plugin indent on

" set tab width to 4 spaces
set expandtab tabstop=4 shiftwidth=4
" enable auto-indent
set autoindent
set smartindent

" show line numbers
set number

" enable mouse support
set mouse=nvi

" enable clipboard support
set clipboard=unnamedplus

" set up plugin manager (vim-plug)
call plug#begin('~/.vim/plugged')

" python specific plugins
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'

call plug#end()

" configure python syntax highlighting
let g:python_highlighting_all = 1

" Configure ALE (Asynchronous Lint Engine)
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['autopep8']}
let g:ale_fix_on_save = 1

" Configure CoC (Conquer of Completion)
let g:coc_global_extensions = ['coc-pyright']

" Key mappings for CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" press enter to confirm autocompletion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<CR>"

" use tab and shift-tab to navigate through suggestions
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" NERDTree settings
nnoremap <C-n> :NERDTreeToggle<CR>

" Set colorscheme
colorscheme onedark

" always keep cursor 3 lines away from screen
set scrolloff=3

