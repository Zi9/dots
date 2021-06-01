syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

"Plugins
Plug 'junegunn/fzf'                     "Fuzzy finder
Plug 'junegunn/fzf.vim'

Plug 'lambdalisue/fern.vim'             "File browser
Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'mbbill/undotree'                  "Undo tree

Plug 'sheerun/vim-polyglot'             "Language pack
Plug 'dense-analysis/ale'               "Syntax checker
Plug 'joshdick/onedark.vim'             "Colorscheme

Plug 'itchyny/lightline.vim'            "Status line
Plug 'mengelbrecht/lightline-bufferline'

Plug 'jiangmiao/auto-pairs'             "Auto pair
Plug 'frazrepo/vim-rainbow'             "Rainbow colored parentheses
Plug 'tpope/vim-surround'               "Surround

Plug 'Konfekt/FastFold'                 "Fast folding
Plug 'tmhedberg/SimpylFold'             "Better Python folding
Plug 'Yggdroot/indentLine'              "Indentation line
Plug 'junegunn/vim-easy-align'          "Easy alignment

Plug 'preservim/nerdcommenter'          "Commenter
Plug 'ryanoasis/vim-devicons'           "Icons

call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

"Sets
set autoindent
set background=dark
set backspace=indent,eol,start
set clipboard+=unnamed
set cmdheight=2
set completeopt-=preview
set expandtab
set foldlevelstart=99
set hidden
set ignorecase
set incsearch
set incsearch
set list
set mouse=a
set noshowmode
set number
set relativenumber
set ruler
set scrolloff=7
set shiftwidth=4
set shortmess+=c
set showcmd
set showtabline=2
set signcolumn=yes
set smartcase
set tabstop=4
set updatetime=300
set wildmenu
set exrc

"Lets
let g:loaded_netrw= 1
let g:netrw_loaded_netrwPlugin= 1

let g:python_highlight_all = 1
let g:indentLine_char = '▏'

let g:onedark_terminal_italics = 1
let g:onedark_color_overrides = {
\ "black": {"gui": "#1E2127", "cterm": "235", "cterm16": "0" },
\}

let g:lightline = {
\ 'colorscheme': 'onedark',
\ 'tabline': {
\   'left': [ ['buffers'] ],
\   'right': []
\ },
\ 'component_expand': {
\   'buffers': 'lightline#bufferline#buffers'
\ },
\ 'component_type': {
\   'buffers': 'tabsel'
\ },
\ 'component_function': {
\   'filetype': 'MyFiletype',
\   'fileformat': 'MyFileformat',
\ },
\ 'mode_map': {
\ 'n' : '',
\ 'i' : '',
\ 'R' : '',
\ 'v' : '',
\ 'V' : '',
\ "\<C-v>": '',
\ 'c' : '',
\ 's' : '',
\ 'S' : '',
\ "\<C-s>": '',
\ 't': '',
\ }
\}
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1

let g:fern#renderer = "devicons"
let g:fern_renderer_devicons_disable_warning = 1

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction



colorscheme onedark

"Autocommands
au FileType python          set cc=88
au FileType html            set ts=1 sw=1
au Filetype c,cs,cpp,python call rainbow#load()
au VimLeave *               set guicursor=a:hor100-blinkon1

"Mappings
let mapleader = " "
nnoremap <leader>w :w!
nnoremap <leader>b :Fern . -drawer -toggle -reveal=%<cr>
nnoremap <leader>t :TagbarToggle<cr>
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <leader>/ :noh<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fa :Ag<Space>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>x :bprev<cr>:bd #<cr>

nnoremap <F4> :set relativenumber!<cr>
nnoremap <F9> :bprev<cr>
nnoremap <F10> :bnext<cr>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
