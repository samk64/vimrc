set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'                " file navigation - requisite for NERDTreeTabs 
"Plugin 'jistr/vim-nerdtree-tabs'            " file navigation - variant of NERDTree
"Plugin 'wincent/command-t'                  " file navigation - fuzzy file search
Plugin 'majutsushi/tagbar'                  " class outline viewer
Plugin 'sickill/vim-monokai'                " colorscheme monokai
Plugin 'tpope/vim-fugitive'                 " git wrapper
Plugin 'ctrlpvim/ctrlp.vim'                 " fuzzy search
Plugin 'rking/ag.vim'                       " Vim plugin for silver searcher (:Ag)
                                            " e    to open file and close the quickfix window
                                            " o    to open (same as enter)
                                            " go   to preview file (open but maintain focus on ag.vim results)
                                            " t    to open in new tab
                                            " T    to open in new tab silently
                                            " h    to open in horizontal split
                                            " H    to open in horizontal split silently
                                            " v    to open in vertical split
                                            " gv   to open in vertical split silently
                                            " q    to close the quickfix window
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'mfukar/robotframework-vim'
Plugin 'jeetsukumaran/vim-indentwise'       " indent-level based motion
Plugin 'tpope/vim-sleuth'                   " adjust shiftwidth and expandtab
Plugin 'groenewege/vim-less'                " less syntax
Plugin 'digitaltoad/vim-pug'                " pug syntax
Plugin 'tpope/vim-commentary'               " comment out lines - use gcc or gc<motion>
Plugin 'vim-syntastic/syntastic'            " syntax checker
Plugin 'mxw/vim-jsx'                        " react syntax
Plugin 'chrisbra/unicode.vim'               " completion for unicode glyphs
Plugin 'xolox/vim-misc'                     " misc auto-load scripts
Plugin 'xolox/vim-session'                  " extended session management

" declare all vundle plugins before this line
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required - filetype plugin based indentation

"set shell=/bin/sh

"""""""""""""""""""""""
" Settings
"""""""""""""""""""""""
set tabstop=4                               " Width of a TAB displayed as 4 spaces
                                            " Indents, '>', will have a width of 4
set softtabstop=0
set shiftwidth=4                            " Expand tabs to spaces
set expandtab!
set smarttab
set list                                    " show whitespace
"set autoindent
set nowrap                                  " No text wrapping
filetype plugin indent on                   " Allow cursor to places with no actual character (column edit)
set virtualedit=block
set number                                  " Show line numbers
"set relativenumber                          " Relative line numbering
" set paste                                 " Don't indent when pasting
set noautochdir                             " Disable auto change working directory
set incsearch                               " Incremental search
set encoding=utf-8                          " Encode utf-8, helps with NERDTree folders

"""""""""""""""
" Code folding
"""""""""""""""
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
" Put vertical split buffers on the right
set splitright
set mouse=a                                 " Mouse scrolling
set ttymouse=xterm2                         " Use mouse in xterm
set swb=usetab                              " Use existing tab when opening buffer

au BufReadPost Jenkinsfile set syntax=groovy
au BufReadPost Jenkinsfile set filetype=groovy
au BufReadPost *.ts,*.tsx set syntax=javascript
au BufReadPost *.ts,*.tsx set filetype=javascript
" autocmd BufNewFile,BufReadPost *.ts,*.tsx set filetype=js

"""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""
" leader key allows user-defined custom commands
let mapleader=','

"map <leader>b :ls<cr>:b<space> " Commented out in favor of ctrlp
" toggle paste mode for pasting from clipboard
set pastetoggle=<leader>p
" open vimrc in a new tab
map <leader>vimrc :tabe ~/.vimrc<cr>
" reload .vimrc on write
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""
map <Leader>n :NERDTreeToggle<CR>
map <Leader>s :NERDTreeFind<CR>
" let NERDTreeDirArrows=0
" Tagbar (Class method listing)
nnoremap <Leader>c :TagbarToggle<CR>
"""""""""""""""
" Vim-Commentary hotkey
"""""""""""""""
noremap <leader>/ :Commentary<cr>
"""""""""""""""
" Ctags Navigation
"""""""""""""""
" set tags=~/ctags
" set tags=~/dev/github/ctags
set tags=~/dev/github/ctags_spectrum
"nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
nnoremap <silent><C-]> <C-w><C-]><C-w>T

"""""""""""""""
" CommandT - Ctrl+t opens in the same tab
"""""""""""""""
"let g:CommandTAcceptSelectionMap = '<C-t>'

" Enter opens selected file in tab
"let g:CommandTAcceptSelectionTabMap = '<CR>'
set wildignore+=*.rst,*.git,*.swp,*.bak,*/_tmp/**,*/node_modules/**

" Search from current working directory
let g:CommandTTraverseSCM = 'pwd'

"""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""
" show hidden files
let g:ctrlp_show_hidden = 1 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP' 
    " Options
    " CtrlP
    " CtrlPLastMode
    " CtrlPMRU
    " CtrlPBuffer 
    " CtrlPLine 
    " CtrlPTag 
    " CtrlPBufTag 
let g:ctrlp_extensions = ['buffertag', 'line', 'dir'] " 'tag' 
" Search from current working directory
let g:ctrlp_working_path_mode = 0
" Hotkeys ctrl+k to line search
nnoremap <C-k> <Esc>:CtrlPLine<CR> 
" Hotkeys leader+t to search tags
nnoremap <Leader>r :CtrlPBufTag<CR>
" Search the entire codebase
nnoremap <Leader>t :CtrlP ~/dev/github<CR>
nnoremap <Leader>m :CtrlPMRU<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

"""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Syntastic setup
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*%<%=%F\ %l\:%c
" let g:syntastic_python_checkers = ['pep8', 'pep257', 'python', 'pylint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_loc_list_height = 5
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['python'],'passive_filetypes': [] }
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [''], 'passive_filetypes': [] }
" nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
nnoremap <Leader>T :SyntasticToggleMode<CR>
nnoremap <Leader>R :SyntasticReset<CR>
nnoremap <Leader>C :SyntasticCheck<CR>
"""""""""""""""""""""""
" The Silver Searcher
"""""""""""""""""""""""
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --ignore-dir dist --ignore-dir node_modules --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" custom ctrlp ignore settings
" unlet g:ctrlp_user_command
" unlet g:ctrlp_custom_ignore
" let g:ctrlp_custom_ignore = {
"     \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$',
"     \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" Vim Session
let g:session_autosave='yes'
let g:session_autoload='no'
nnoremap <leader>so :OpenSession 
" nnoremap <leader>ss :SaveSession 
" nnoremap <leader>sd :DeleteSession<CR>
" nnoremap <leader>sc :CloseSession<CR>

"""""""""""""""""""""""
" Display
"""""""""""""""""""""""
set t_Co=256
set bg=dark
colorscheme monokai
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

