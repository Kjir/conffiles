call plug#begin('~/.config/nvim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rbenv'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'unblevable/quick-scope'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'rstacruz/sparkup', { 'rtp': 'vim/' }
Plug 'bronson/vim-trailing-whitespace'
Plug 'Olical/vim-syntax-expand'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
" Plug 'abudden/taghighlight-automirror'
Plug 'othree/html5.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'janko-m/vim-test'
Plug 'lfilho/cosco.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'haya14busa/incsearch.vim'
Plug 'luochen1990/rainbow'
Plug 'edkolev/tmuxline.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'sbdchd/neoformat'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

if has('nvim')
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
  Plug 'Shougo/deoplete-rct', {'for': 'ruby'}
  Plug 'ervandew/supertab'
  Plug 'w0rp/ale'
else
  Plug 'scrooloose/syntastic'
  Plug 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer'}
  Plug 'tpope/vim-sensible'
endif

" filetype plugins
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
Plug 'fatih/vim-nginx' , {'for': 'nginx'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
Plug 'burnettk/vim-angular', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'heavenshell/vim-jsdoc', {'for': 'javascript'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'juanpabloaj/vim-istanbul', {'for': 'javascript'}
Plug 'carlitux/deoplete-ternjs', {'for': 'javascript'}
Plug 'galooshi/vim-import-js', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'mhartington/nvim-typescript', {'for': 'typescript'}
Plug 'slim-template/vim-slim', {'for': 'slim'}
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'elmcast/elm-vim', {'for': 'elm'}
Plug 'pbogut/deoplete-elm', {'for': 'elm'}
Plug 'kchmck/vim-coffee-script'
Plug 'cespare/vim-toml'

" colorschemes
Plug 'tomasr/molokai'
Plug 'vim-scripts/Guardian'
Plug 'vim-scripts/Distinguished'
Plug 'croaker/mustang-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'justincampbell/vim-railscasts'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhinz/vim-janah'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'whatyouhide/vim-gotham'
Plug 'kabbamine/yowish.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'nightsense/seabird'
Plug 'rakr/vim-one'
Plug 'endel/vim-github-colorscheme'
Plug 'google/vim-colorscheme-primary'

call plug#end()

"=====================================================
"===================== SETTINGS ======================

" I'm still using Vim from time to time. These needs to enabled so we can make
" Vim usable again (these are default on NeoVim)
if !has('nvim')
  set nocompatible
  filetype off
  filetype plugin indent on

  set ttyfast
  set ttymouse=xterm2
  set ttyscroll=3

  set laststatus=2
  set encoding=utf-8              " Set default encoding to UTF-8
  " set autoread                    " Automatically reread changed files without asking me anything
  set autoindent
  set backspace=indent,eol,start  " Makes backspace key more powerful.
  set incsearch                   " Shows the match while typing
  set hlsearch                    " Highlight found searches
endif

set noerrorbells             " No beeps
set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set noshowmode               " Show current mode.
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case 
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set expandtab

set pumheight=10             " Completion window max size

set shell=bash

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif

if has("gui_macvim")
  " No toolbars, menu or scrollbars in the GUI
  set guifont=Sauce\ Code\ Powerline\ Light:h13
  set guifont=Anonymice\ Powerline\ Nerd\ Font\ Complete\ Windows\ Compatible:h14
  set clipboard+=unnamed
  set vb t_vb=
  set guioptions-=m  "no menu
  set guioptions-=T  "no toolbar
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r  "no scrollbar
  set guioptions-=R


else
  if !has('nvim')
    syntax enable
    set t_Co=256
  endif

  let g:rehash256 = 1

endif

" Neomake colors. To be defined before setting the colorscheme
" if exists('g:plugs["neomake"]')
"   augroup my_error_signs
"     au!
"     autocmd ColorScheme *
"           \ hi NeomakeErrorSign ctermfg=red
"   augroup end
" endif

if !has("gui_macvim")
  set background=dark
endif
" Dark background
" colorscheme one
" Light background
colorscheme one

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

set tabstop=2
set shiftwidth=2

au BufNewFile,BufRead *.vim setlocal noet ts=2 sw=2 sts=2
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4

autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 textwidth=120
autocmd FileType php setlocal noexpandtab shiftwidth=4 tabstop=4

augroup filetypedetect
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
augroup END

"=====================================================
"===================== MAPPINGS ======================

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" This trigger takes advantage of the fact that the quickfix window can be
" easily distinguished by its file-type, qf. The wincmd J command is
" equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" the very bottom (see :help :wincmd and :help ^WJ).
" autocmd FileType qf wincmd J

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Source the current Vim file
nnoremap <leader>pr :Runtime<CR>

" Resize window quickly
" nnoremap <silent> <A-Right> :vertical resize +10<CR>
" nnoremap <silent> <A-Left> :vertical resize -10<CR>
" nnoremap <silent> <A-Up> :resize +10<CR>
" nnoremap <silent> <A-Down> :resize -10<CR>
" if bufwinnr(1)
"   map = <C-W>>
"   map - <C-W><
" endif

" Terminal settings
if has('nvim')
  " Leader q to exit terminal mode. Somehow it jumps to the end, so jump to
  " the top again
  tnoremap <Leader>q <C-\><C-n>gg<cr>

  " mappings to move out from terminal to other views
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  " Open terminal in vertical, horizontal and new tab
  " nnoremap <leader>tv :vsplit term://zsh<CR>
  " nnoremap <leader>ts :split term://zsh<CR>
  " nnoremap <leader>tt :tabnew term://zsh<CR>

  " always start terminal in insert mode
  autocmd BufWinEnter,WinEnter term://* startinsert
endif

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
if !has('gui_running')
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Visual Mode */# from Scrooloose {{{
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>


"====================================================
"===================== PLUGINS ======================

" ==================== Fugitive ====================
if exists('g:plugs["vim-fugitive"]')
  vnoremap <leader>gb :Gblame<CR>
  nnoremap <leader>gb :Gblame<CR>
endif

" ==================== CtrlP ====================
if exists('g:plugs["ctrlp.vim"]')
  let g:ctrlp_cmd = 'CtrlPMRU'
  let g:ctrlp_working_path_mode = 'ra'
  " let g:ctrlp_max_height = 10		" maxiumum height of match window
  let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
  let g:ctrlp_mruf_max=450 		" number of recently opened files
  let g:ctrlp_max_files=0  		" do not limit the number of searchable files
  let g:ctrlp_use_caching = 1
  let g:ctrlp_clear_cache_on_exit = 0
  let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

  let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10,results:10'

  let g:ctrlp_custom_ignore = '\v[\/](dist|docs|tests-results|bower_components|node_modules)$'

  nmap <C-b> :CtrlPCurWD<cr>
  imap <C-b> <esc>:CtrlPCurWD<cr>
endif

" ==================== delimitMate ====================
if exists('g:plugs["delimitMate"]')
  let g:delimitMate_expand_cr = 1
  let g:delimitMate_expand_space = 1
  let g:delimitMate_smart_quotes = 1
  let g:delimitMate_expand_inside_quotes = 0
  let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

  " imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
endif

" ==================== Airline =====================
" Airline configuration
if exists('g:plugs["vim-airline"]')
  let g:airline_powerline_fonts=1
endif

" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

" ==================== vim-json ====================
let g:vim_json_syntax_conceal = 0

" ==================== Completion =========================
" I use deoplete for Neovim and neocomplete for Vim.
if exists('g:plugs["deoplete.nvim"]')
  let g:deoplete#enable_at_startup = 1
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  " let g:deoplete#ignore_sources = {}
  " let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']

  " Use partial fuzzy matches like YouCompleteMe
  call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
  " call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
  call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
endif

" ==================== UltiSnips ====================
if exists('g:plugs["ultisnips"]')
  " function! g:UltiSnips_Complete()
  "   call UltiSnips#ExpandSnippet()
  "   if g:ulti_expand_res == 0
  "     if pumvisible()
  "       return "\<C-n>"
  "     else
  "       call UltiSnips#JumpForwards()
  "       if g:ulti_jump_forwards_res == 0
  "         return "\<TAB>"
  "       endif
  "     endif
  "   endif
  "   return ""
  " endfunction
  " 
  " function! g:UltiSnips_Reverse()
  "   call UltiSnips#JumpBackwards()
  "   if g:ulti_jump_backwards_res == 0
  "     return "\<C-P>"
  "   endif
  " 
  "   return ""
  " endfunction
  " 
  " 
  " if !exists("g:UltiSnipsJumpForwardTrigger")
  "   let g:UltiSnipsJumpForwardTrigger = "<tab>"
  " endif
  " 
  " if !exists("g:UltiSnipsJumpBackwardTrigger")
  "   let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  " endif
  " 
  " au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
  " au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
  autocmd FileType javascript UltiSnipsAddFiletypes javascript-angular.javascript-jasmine.javascript
  autocmd FileType php UltiSnipsAddFiletypes php-laravel
endif

" ==================== Syntastic ====================
" This does what it says on the tin. It will check your file on open too, not just on save.
" You might not want this, so just leave it out if you don't.
if exists('g:plugs["syntastic"]')
  let g:syntastic_check_on_open=1
  let g:syntastic_javascript_checkers=['eslint', 'jshint']
endif

" ==================== Tern ====================
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  " let g:tern#command = ["tern"]
  " let g:tern#arguments = ["--persistent"]
endif

" ==================== FZF ====================
if exists('g:plugs["fzf.vim"]')
  nmap <C-P> :History<cr>
  nmap <C-F> :GFiles<cr>
endif

" ==================== Various other plugin settings ====================
" Add JSDoc to the nearest function
nmap <silent> <Leader>j ?function<cr>:noh<cr><Plug>(jsdoc)

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" General conceal settings. Will keep things concealed
" even when your cursor is on top of them.
" set conceallevel=0
" set concealcursor="nc"
" vim-javascript conceal settings.
" let g:javascript_conceal_function = "ƒ"
" let g:javascript_conceal_this = "†"
" let g:javascript_conceal_return = "®"

" Python setup
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" vim-test configuration
let test#strategy = 'neovim'
nnoremap <Leader>t :TestNearest<CR>
autocmd FileType javascript set makeprg=grunt
let g:tmux_session=0

" indentLine configuration

" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '▵'
let g:indentLine_char = '┆'

" Cosco
if exists('g:plugs["cosco.vim"]')
  autocmd FileType javascript,css nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
  autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>
endif

" Istanbul coverage
let g:coverage_json_path = 'tests-results/coverage/coverage-final.json'
if exists('g:plugs["vim-istanbul"]')
  nmap <Leader>cs :IstanbulShow<CR>
  nmap <Leader>ch :IstanbulHide<CR>
endif

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let g:rainbow_active = 0

" Rich colours!
set termguicolors

" Slim/Slime templates
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd BufNewFile,BufRead *.slime setlocal filetype=slim

" JSX in javascript files
let g:jsx_ext_required = 0

" Use formatprg when available to reformat code
let g:neoformat_try_formatprg = 1
autocmd FileType javascript set formatprg=prettier

" Better ALE signs
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
" Disable linting on erb files
let g:ale_linters = { 'eruby': [] }

" Enable automatic formatting
augroup fmt
  autocmd!
  autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | endtry
augroup END

" vim:ts=2:sw=2:et
