" ============================================================================
" " Vim-plug initialization
" " Avoid modify this section, unless you are very sure of what you are doing
"
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
        echo "Installing Vim-plug..."
        echo ""
        silent !mkdir -p ~/.vim/autoload
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
"
if vim_plug_just_installed
        :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)
"
"
" ============================================================================
" Active plugins
" You can disable or add new ones here:
"
" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use

call plug#begin('~/.vim/plugged')

" Plugins from github repos:
"


"
" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()


" ============================================================================
" " Install plugins the first time vim runs
"
if vim_plug_just_installed
        echo "Installing Bundles, please ignore key map error messages"
        :PlugInstall
endif

" Colors
let vim_color_path = expand('~/.vim/colors/badwolf.vim')
if !filereadable(vim_color_path)
        echo "Installing Vim-color..."
        echo ""
        silent !mkdir -p ~/.vim/colors
        silent !curl -fLo ~/.vim/colors/badwolf.vim --create-dirs https://bitbucket.org/sjl/badwolf/raw/tip/colors/badwolf.vim
endif
colorscheme badwolf


" no vi-compatible
set nocompatible

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" always show status bar
set ls=2



" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" show line numbers
set nu


"" MacVim {{{
set guioptions-=r 
set guioptions-=L
" }}}
"
