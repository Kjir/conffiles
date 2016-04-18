set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'reinh/vim-makegreen'
Plugin 'kchmck/vim-coffee-script'
Plugin 'alfredodeza/khuno.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'gregsexton/gitv'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'janko-m/vim-test'
Plugin 'edkolev/promptline.vim'
" Plugin 'jmcantrell/vim-virtualenv'
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'wincent/Command-T'
" Plugin 'kien/ctrlp.vim'
" vim-scripts repos
Plugin 'molokai'
Plugin 'Guardian'
Plugin 'Distinguished'
Plugin 'croaker/mustang-vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'psp.vim'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

" Powerline setup
" set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 13
set guifont=Source\ Code\ Pro\ for\ Powerline\ Ultra-Light\ 13
set guioptions-=T
set laststatus=2


" Personal settings

colorscheme molokai
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set wildignore=.git,*.pyc,*.pyo
autocmd FileType python set textwidth=79
autocmd FileType python set number
autocmd FileType python,psp compiler rake
autocmd BufNewFile,BufRead *.psp set filetype=psp
let g:khuno_flake_cmd="/usr/bin/flake8"
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle ~/devel/svn<CR>

"Map unite to Ctrl-P
nnoremap <C-p> :Unite -toggle -auto-resize file_rec/async<CR>
nnoremap <Leader>y :Unite -toggle -auto-resize history/yank<CR>
nnoremap <Leader>/ :Unite -no-quit grep:.<CR>
" Some configuration
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','ignore_pattern', join([
            \ '\.tox',
            \ '\.test',
            \ '\.eggs',
            \ 'doc/webworks',
            \ 'doc/html',
            \ 'src/_lang'
            \ ], '\|'))
call unite#custom#source('line,outline','matchers','matcher_fuzzy')
call unite#custom#profile('default', 'context', {
            \ 'start_insert': 1,
            \ 'direction': 'botright',
            \ })
let g:unite_source_history_yank_enable=1
" Use ag to search with grep
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4 --ignore doc'
let g:unite_source_grep_recursive_opt=''

" Disable jedi-vim completions because we have YouCompleteMe
let g:jedi#completions_enabled = 0

" Airline configuration
let g:airline_powerline_fonts=1

" Vim test configuration
let test#strategy='dispatch'

" Promptline configuration
let g:promptline_preset = {
        \'a' : [ promptline#slices#host() ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'x' : [ promptline#slices#vcs_branch() ],
        \'y' : [ promptline#slices#git_status() ],
        \'z' : [ promptline#slices#python_virtualenv() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
" let g:promptline_theme='jell'
