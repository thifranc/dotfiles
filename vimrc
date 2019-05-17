" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"All vundle
set rtp+=~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'nanotech/jellybeans.vim'
" Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'hashivim/vim-terraform'
Plugin 'puppetlabs/puppet-syntax-vim'
 

" All of your Plugins must be added before the following line
call vundle#end()            " required

nnoremap J <C-W><C-J>
nnoremap K <C-W><C-K>
nnoremap L <C-W><C-L>
nnoremap H <C-W><C-H>

filetype plugin indent on    " required

colorscheme jellybeans
syntax on

set smartindent
set nu
set hlsearch
set ignorecase
set noet
set tabstop=4

" Resize split when window is resized
au VimResized * :wincmd =

" set puppet filetype for .pp extension files
autocmd BufRead,BufNewFile *.pp set filetype=puppet
" set ruby filetype for .rb extension files
autocmd BufRead,BufNewFile *.rb set filetype=ruby
" set filtetype to terraform for .tf files
autocmd BufRead,BufNewFile *.tf set filetype=terraform
autocmd BufRead,BufNewFile *.tfvars set filetype=terraform

" for jade/html files, 2 spaces
autocmd Filetype html setl ts=2 sw=2 sts=0 expandtab
autocmd Filetype json setl ts=2 sw=2 sts=0 expandtab
autocmd Filetype javascript setl ts=2 sw=2 sts=0 expandtab
autocmd Filetype python setl ts=2 sw=2 sts=0 expandtab
autocmd Filetype jade setl ts=2 sw=2 sts=0 expandtab
autocmd Filetype css setl ts=2 sw=2 sts=0 expandtab
autocmd Filetype pug setl ts=2 sw=2 sts=0 expandtab
autocmd Filetype yaml setl ts=2 sw=2 sts=0 expandtab
autocmd Filetype puppet setl ts=2 sw=2 sts=0 expandtab
autocmd Filetype terraform setl ts=2 sw=2 sts=0 expandtab
autocmd Filetype ruby setl ts=2 sw=2 sts=0 expandtab
autocmd Filetype sh setl ts=4 sw=4 sts=0 expandtab

"launch nerdTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"resive NerdTree
:let g:NERDTreeWinSize=20
"toggle NerdTree
map <C-P> :NERDTreeToggle<CR>
"close NerdTree if alone
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

