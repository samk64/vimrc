set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'                " file navigation - requisite for NERDTreeTabs 
Plugin 'jistr/vim-nerdtree-tabs'            " file navigation - variant of NERDTree
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
Plugin 'vim-surround'
Plugin 'vim-repeat'
Plugin 'robotframework-vim'
Plugin 'jeetsukumaran/vim-indentwise'       " indent-level based motion
Plugin 'ciaranm/detectindent'               " guess correct indent settings


" declare all vundle plugins before this line
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required - filetype plugin based indentation

"set shell=/bin/sh

"""""""""""""""""""""""
" Settings
"""""""""""""""""""""""
" Width of a TAB displayed as 4 spaces
set tabstop=4
" Indents, '>', will have a width of 4
set shiftwidth=4
" Expand tabs to spaces
"set expandtab
" Allow cursor to places with no actual character (column edit)
set virtualedit=block
" Show line numbers
set number
" Don't indent when pasting
" set paste
" Disable auto change working directory
set noautochdir
" Incremental search
set incsearch
" Encode utf-8, helps with NERDTree folders
set encoding=utf-8
" Code folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2
" Put vertical split buffers on the right
set splitright
"""""""""""""""""""""""
" Key Mappings
"""""""""""""""""""""""
" leader key allows user-defined custom commands
let mapleader=','

map <leader>ne :set noexpandtab<cr>
" open vimrc in a new tab
map <leader>vimrc :tabe ~/.vimrc<cr>
" reload .vimrc on write
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>s <plug>NERDTreeTabsFind<CR>
" let NERDTreeDirArrows=0
" Tagbar (Class method listing)
nnoremap <Leader>c :TagbarToggle<CR>

" Code Navigation
set tags=~/ctags

" CommandT - Ctrl+t opens in the same tab
"let g:CommandTAcceptSelectionMap = '<C-t>'

" Enter opens selected file in tab
"let g:CommandTAcceptSelectionTabMap = '<CR>'
set wildignore+=*.rst,*.git,*.swp,*.bak,*/_tmp/**,*/node_modules/**

" Search from current working directory
let g:CommandTTraverseSCM = 'pwd'

" CtrlP
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
" nnoremap <C-k> <Esc>:CtrlPLine<CR> 
" Hotkeys leader+t to search tags
nnoremap <Leader>r :CtrlPBufTag<CR>
nnoremap <Leader>t :CtrlP ~/<CR>
nnoremap <Leader>m :CtrlPMRU<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"""""""""""""""""""""""
" Display
"""""""""""""""""""""""
set t_Co=256
set bg=dark
colorscheme monokai
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

