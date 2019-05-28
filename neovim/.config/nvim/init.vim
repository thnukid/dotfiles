" Vim-Plug plugin configuration
" https://github.com/junegunn/vim-plug#usage
call plug#begin('~/.local/share/nvim/plugged')

" File browser
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-webdevicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Fast file searching
Plug 'ctrlpvim/ctrlp.vim'

" Colors
Plug 'altercation/vim-colors-solarized'

" Powerline clone
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Languages
Plug 'othree/yajs.vim'
Plug 'tpope/vim-endwise'

" Templates
Plug 'slim-template/vim-slim'
" jsx
Plug 'mxw/vim-jsx'
" json
Plug 'leshill/vim-json'
" typescript
Plug 'leafgarland/typescript-vim'

" Emmet Zen coding
Plug 'mattn/emmet-vim'

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

" testing
Plug 'janko-m/vim-test'
Plug 'tpope/vim-cucumber'

" code linter
Plug 'scrooloose/syntastic'

" prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" modern javascript https://javascriptplayground.com/blog/2017/01/vim-for-javascript/
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" Typescript Support
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Autocomplete async
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Use deoplete.
let g:deoplete#enable_at_startup = 1

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(yarn bin):$PATH && which flow'))

if g:flow_path != 'flow not found'
  let g:deoplete#sources#flow#flow_bin = g:flow_path
endif

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Formatting
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'matze/vim-move'

Plug 'ervandew/supertab' " Supertab completion
Plug 'mustache/vim-mustache-handlebars' " mustache and handlebars templates

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" vim-mustache-handlebars
let g:mustache_abbreviations = 1
let g:mustache_operators = 1

" Solarized
syntax enable
set background=dark
colorscheme solarized

" show line numbers
set number

" autoread files that have changed
set autoread

" remap <leader> to <space>
let mapleader = "\<Space>"

" folding http://vim.wikia.com/wiki/Folding
" setlocal foldmethod=syntax

" indent & tab stuff
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set expandtab
set list

" Spacing
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype slim setlocal ts=2 sts=2 sw=2
autocmd Filetype yml setlocal ts=4 sts=4 sw=4

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme= 'solarized'
let g:airline#extensions#tabline#enabled = 1

" NERDtree
nmap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeShowHidden=1

" CtrlP
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$|vendor\/bundle|bower_components|node_modules|tmp|_build',
      \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.beam$\|\.class$\|\.o$\|\~$\',
      \ }

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

"

" show colorcolumn 80
set colorcolumn=80
highlight ColorColumn ctermbg=0

set guifont=Hack\ Regular\ Nerd\ Font\ Complete
set encoding=utf-8
set nowrap " no wrapping of lines
set mouse=a " enable mouse scrolling

" nerdcommenter
let NERDSpaceDelims=1

" vim-move
let g:move_key_modifier = 'C'

nmap <leader>sn :e ~/.local/share/nvim/snippets/ruby.snippets<CR>

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
nmap <leader>ss :Rview<cr>

function! SplitStrategy(cmd)
  botright new | call termopen(a:cmd) | startinsert
endfunction
let g:test#custom_strategies = {'terminal_split': function('SplitStrategy')}
let g:test#strategy = 'terminal_split'

" Buffer
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
" nmap <leader>bt :enew<cr>

" Move to the next buffer
" nmap <leader>l :bnext<CR>

" Move to the previous buffer
" nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
" nmap <leader>q :bp <BAR> bd #<CR>

" show invisible
set list
set listchars=tab:→\ ,trail:∙,nbsp:•

" the way of vim
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Tab Shortcuts
nnoremap tk :tabfirst<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tj :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :CtrlSpaceTabLabel<CR>
nnoremap td :tabclose<CR>

" Prettier save
nmap <Leader>mp <Plug>(Prettier)

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_ballons=has('ballon_eval')
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=3

let g:syntastic_javascript_checkers = ['eslint'] " ['jshint', 'eslint']
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" Emmet Zen Coding
"   Just html, css
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" let g:user_emmet_leader_key='<C-G>.'

" Mapping for Tabularize (http://vimcasts.org/episodes/aligning-text-with-tabular-vim)
if exists(":Tabularize")
  nmap <Leader>tab<bar> :Tabularize /<bar><CR>
  vmap <Leader>tab<bar> :Tabularize /<bar><CR>
  nmap <Leader>tab= :Tabularize /=<CR>
  vmap <Leader>tab= :Tabularize /=<CR>
  nmap <Leader>tab: :Tabularize /:\zs<CR>
  vmap <Leader>tab: :Tabularize /:\zs<CR>
endif

" Automatically removing all trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  %s/\t/  /ge
  call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" set filetype for hamlc and es6
au! BufRead,BufNewFile *.hamlc setfiletype haml
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
