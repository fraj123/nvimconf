call plug#begin(stdpath('data') . '/plugged')

" Vim Align Plugin
Plug 'junegunn/vim-easy-align'
" Multicursor Plugin
Plug 'mg979/vim-visual-multi'

" Color
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'

"HTML5
Plug 'mattn/emmet-vim'

" Fuzy search plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Code Snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Match tags and close it
"Plug 'Valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'

" Syntax Highllight
Plug 'sheerun/vim-polyglot'

call plug#end()

" Setting: {{{
filetype indent plugin on
if !exists('g:syntax_on') | syntax enable | endif
set encoding=utf-8
scriptencoding utf-8

set backspace=indent,eol,start
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=-1
set tabstop=8
set textwidth=80
set title
set number

set hidden
set nofixendofline
set nostartofline
set splitbelow
set splitright

set hlsearch
set incsearch
set laststatus=2
set noruler
set signcolumn=yes
set updatetime=1000

set cmdheight=2
set nobackup
set nowritebackup
set shortmess+=c

colorscheme onedark
" }}}

" Onedarkconf: {{{
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" }}}

" Coc Java: {{{
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" }}}

" Vim_Align_Plugin: {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Vim_Multicursor_Plugin: {{{
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
" }}}

" Enable_emmet_just_for_html_css: {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" }}}

" Personal_kbind: {{{
vnoremap <c-t> :split<CR>:ter<CR>:resize 10<CR>
nnoremap <c-t> :split<CR>:ter<CR>:resize 10<CR>
map <c-f> :Files<CR>
"}}}
