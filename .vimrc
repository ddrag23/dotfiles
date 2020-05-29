" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/Glench/Vim-Jinja2-Syntax.git'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/honza/vim-snippets.git' 
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/jistr/vim-nerdtree-tabs.git'
" Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'KabbAmine/vCoolor.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" --------------------------------------------------------------------------------------------------------------------------
" SETTING
" --------------------------------------------------------------------------------------------------------------------------

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" tittle
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Whitespace
set wrap
set textwidth=80
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

"indentline
set smartindent
let g:indentLine_faster = 1

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
set ttimeoutlen=50  " make Esc work faster
set cursorline " visually mark current line
set novisualbell " don't blink
hi  clear ModeMsg " disable Color StatusLine on Insert Mode and Visual Mode

" Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"------------------------------------------------------------------------------------------------------------------------
" MAPPING KEY
" -----------------------------------------------------------------------------------------------------------------------
"commentary{
noremap <Leader>/ :Commentary<CR>
" }

"Nerdtree Map{
nmap <F12> :NERDTreeTabsToggle<CR>
nmap <Leader>x :NERDTreeFind<cr>
" }

"Buffers{
noremap <Leader>n :bn<cr>
noremap <Leader>p :bp<cr>
noremap <Leader>ll :bl<cr>
noremap <Leader>f :bf<cr>
" close buffer
 noremap <leader>q :bp<cr>:bd #<cr>
" " cleanup all vim buffers
 noremap <leader>qq :bufdo bd<cr>
 noremap <leader>qa :bufdo bd!<cr>
" " cleanup all vim buffers, except the active one.
 noremap <leader>qo :call buffer#DeleteOnly()<cr>
" }

" Tabbed Key {
nmap <Leader>t :tabedit $HOME/Project<cr> 
nmap <Leader>tc :tabclose<cr>
" }
"
" Move up/down editor lines {
nnoremap j gj
nnoremap k gk
" }

" Move Window {
nmap <C-h> <C-w><C-h>
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
" }

"" EasyAlign {{{
vmap <leader>a :EasyAlign<cr>
nmap <leader>a :EasyAlign<cr>
" }}}

" Serch Map {
nnoremap / /\v
vnoremap / /\v
map <leader><space> :let @/=''<cr> " clear search
" }
" Open .vimrc
nmap <Leader>c :e $MYVIMRC<cr>
" Reload .vimrc
nmap <leader>r :source $MYVIMRC<cr>

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

"" FZF {{{
" nnoremap <leader><space> :History<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>o :Files<cr>
nnoremap <leader>g :BTags<cr>
nnoremap <leader><leader> :Commands<cr>

" Mapping selecting mappings
 nmap <leader><tab> <plug>(fzf-maps-n)
 xmap <leader><tab> <plug>(fzf-maps-x)
 omap <leader><tab> <plug>(fzf-maps-o)

" " Insert mode completion
 imap <c-x><c-w> <plug>(fzf-complete-word)
 imap <c-x><c-p> <plug>(fzf-complete-path)
 imap <c-x><c-f> <plug>(fzf-complete-file-ag)
 imap <c-x><c-l> <plug>(fzf-complete-line)
"
" " Advanced customization using autoload functions
 inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
 autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
" " }}}

"--------------------------------------------------------------------------------------------------------------------------
" FILETYPE
"--------------------------------------------------------------------------------------------------------------------------

" PHP 
autocmd FileType php setlocal expandtab shiftwidth=4 softtabstop=4
" HTML
autocmd FileType html,jinja2.html setlocal expandtab shiftwidth=2 softtabstop=2
" CSS
autocmd filetype scss,sass,css setlocal expandtab shiftwidth=2 softtabstop=2


"--------------------------------------------------------------------------------------------------------------------------
"THEMES
"--------------------------------------------------------------------------------------------------------------------------

" Color scheme (terminal)
set t_Co=256
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
colorscheme nord
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
" lightline
" let g:lightline = {'colorscheme': 'nord'}
" highlighting try
" highlight ColorColumn guibg='#504945'
" highlight GruvboxGreenSign guibg='#282828' guifg='#b8bb26'
" highlight GruvboxRedSign guibg='#282828' guifg='#fb4934'
" highlight GruvboxAquaSign guibg='#282828' guifg='#8ec07c'
" highlight ALEErrorSign guibg='#e16f7e' guifg='#000000'
" highlight ALEWarningSign guibg='#fdc35f' guifg='#000000'
" highlight ALEInfoSign guibg='#8ca9bf' guifg='#000000'
" highlight clear SignColumn
" highlight! link NERDTreeFlags NERDTreeDir 
" highlighting end
" setting from plug
" fzf
command! -bang Project call fzf#vim#files('~/Project', <bang>0)
