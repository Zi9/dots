syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

"Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf'                     "Fuzzy finder
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'               "File browser
Plug 'majutsushi/tagbar'                "Tag browser
Plug 'mbbill/undotree'                  "Undo tree

Plug 'sheerun/vim-polyglot'             "Language pack
Plug 'dense-analysis/ale'               "Syntax checker
Plug 'joshdick/onedark.vim'             "Colorscheme

Plug 'itchyny/lightline.vim'            "Status line
Plug 'mengelbrecht/lightline-bufferline'

Plug 'jiangmiao/auto-pairs'             "Auto pair
Plug 'frazrepo/vim-rainbow'             "Rainbow colored parentheses

Plug 'Konfekt/FastFold'                 "Fast folding
Plug 'tmhedberg/SimpylFold'             "Better Python folding

Plug 'preservim/nerdcommenter'          "Commenter
Plug 'ryanoasis/vim-devicons'           "Icons for NERDTree

Plug 'aurieh/discord.nvim'              "Discord Rich Presence

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

"Lets
let g:python_highlight_all = 1

let g:onedark_terminal_italics = 1
let g:onedark_color_overrides = {
\ "black": {"gui": "#1E2127", "cterm": "235", "cterm16": "0" },
\}

let g:lightline = {
\ 'colorscheme': 'onedark',
\ 'tabline': {
\   'left': [ ['buffers'] ],
\   'right': [ ['close'] ]
\ },
\ 'component_expand': {
\   'buffers': 'lightline#bufferline#buffers'
\ },
\ 'component_type': {
\   'buffers': 'tabsel'
\ }
\}

colorscheme onedark

"Autocommands
au FileType c,cpp           nnoremap <buffer> <F5> :w<cr>:make run<cr>
au FileType c,cpp           nnoremap <buffer> <F6> :w<cr>:make build<cr>
au FileType python          nnoremap <buffer> <F5> :w<cr>:exec '!python' shellescape(@%, 1)<cr>
au FileType cs              nnoremap <buffer> <F5> :w<cr>:!dotnet run<cr>
au FileType c,cpp           inoremap <buffer> <F5> <esc>:w<cr>:make run<cr>
au FileType c,cpp           inoremap <buffer> <F6> <esc>:w<cr>:make build<cr>
au FileType python          inoremap <buffer> <F5> <esc>:w<cr>:exec '!python' shellescape(@%, 1)<cr>
au FileType cs              inoremap <buffer> <F5> <esc>:w<cr>:!dotnet run<cr>

au FileType c,csharp,python call rainbow#load()
au FileType python          set cc=80
au VimLeave *               set guicursor=a:hor100-blinkon1

"Mappings
let mapleader = " "
nnoremap <leader>w :w!
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>t :TagbarToggle<cr>
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <leader>/ :noh<cr>
nnoremap <leader>ff :Files<Space>
nnoremap <leader>fl :Lines<Space>
nnoremap <leader>fa :Ag<Space>
nnoremap <leader>fb :Buffers<Space>
nnoremap <leader>x :bprev<cr>:bd #<cr>

nnoremap <F4> :set relativenumber!<cr>
nnoremap <F9> :bprev<cr>
nnoremap <F10> :bnext<cr>

"coc settings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

"Commands
command AdocPreview execute "!vivaldi-stable %"
