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

" Better file browser
Plug 'scrooloose/nerdtree'

" tag and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
"Plug 'fisadev/vim-ctrlp-cmdpalette'

" source code browser
Plug 'taglist.vim'

" search and replace
Plug  'mileszs/ack.vim'


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



" ============================================================================
" " Vim settings and mappings
"

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
"


" tab navigation mappings
" jump to tab n
map <C-T>1  :tabn 1<CR>
map <C-T>2  :tabn 2<CR>
map <C-T>3  :tabn 3<CR>
map <C-T>4  :tabn 4<CR>
map <C-T>5  :tabn 5<CR>
map <C-T>6  :tabn 6<CR>
map <C-T>7  :tabn 7<CR>
map <C-T>8  :tabn 8<CR>
map <C-T>9  :tabn 9<CR>
" close current tab
map <C-T>c  :tabc<CR>
" close other tab
map <C-T>o  :tabo<CR>



" ============================================================================
" " Plugins settings and mappings

" NERDTree config
map <F2> :NERDTreeToggle<CR>

" Exit vim when only nerdtree window
function! NERDTreeQuit()
    redir => buffersoutput
    silent buffers
    redir END
"                     1BufNo  2Mods.     3File           4LineNo
    let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
    let windowfound = 0

    for bline in split(buffersoutput, "\n")
        let m = matchlist(bline, pattern)

        if (len(m) > 0)
            if (m[2] =~ '..a..')
                let windowfound = 1
            endif
        endif
    endfor

    if (!windowfound)
        quitall
    endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

" Taglist config
" exit when only taglist
map <F3> :TlistToggle<CR>
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1


" ctrlp config
let g:ctrlp_extensions = ['tag']
let g:ctrlp_types = ['fil', 'tag', 'mru'] 
let g:ctrlp_cmd = 'CtrlPTag'
