" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

filetype off

call plug#begin('~/.vim/plugged')
" colorschemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-wombat-scheme'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'nikolvs/vim-sunbather'
Plug 'dracula/vim'
Plug 'rakr/vim-one'
Plug 'yorickpeterse/happy_hacking.vim'

" autocomplete
"Plug 'ycm-core/YouCompleteMe' " --> compile
"                              " cd ~/.vim/plugged/YouCompleteMe
                               " python3 install.py --all
"Plug 'neoclide/coc.nvim'     " --> alternative to youcompleteme
"                             " somehow buggy, when installed

" vim cheatsheet
"Plug 'dbeniamine/cheat.sh-vim' " vim cheatsheet
"
" Debugger
Plug 'puremourning/vimspector' " needs vim compiled with python3.6

" Maximize Window
Plug 'szw/vim-maximizer'

" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" make
"Plug 'tpope/vim-dispatch'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" other plugins
Plug 'VundleVim/Vundle.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
"Plug 'dense-analysis/ale'
"Plug 'vim-syntastic/syntastic'
Plug 'mbbill/undotree'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'
Plug 'tomasr/molokai'


call plug#end()

"    " open NERDTree automatically
"    autocmd VimEnter * NERDTree
"    " close NERDTree when quit
"    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Set of basic vim options
"set exec " if there is a vimrc inside a folder it will execute it automatically
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartcase "If capital letter case sensitive search, otherwise case insensitive search
"set undodir=~/.vim/undodir
"set undofile
set incsearch
set scrolloff=8
"set signcolumn "for linting

set number
syntax on

" colorschemes
"set termguicolors     " enable true colors support
" -- wombat
"colorscheme wombat
" -- gruvbox
"colorscheme gruvbox
"set background=dark
" -- onedark
"colorscheme onedark
" -- tokyonight
colorscheme tokyonight
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
" -- ayu
"set termguicolors     " enable true colors support
"let ayucolor="light"  " available light, mirage, dark version of theme
"colorscheme ayu
" -- sunbather
"colorscheme sunbather
" -- molokai
"colorscheme molokaiS
" -- dracula
"colorscheme dracula
" -- one
"colorscheme one
"set background=dark " available dark, light
" -- happy hacking
"colorscheme happy_hacking

" mapleader
let mapleader = " "

" NERDTree configurations
let NERDTreeShowHidden=1 " show hidden files

" YouCompleteMe configurations
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0

""" syntastic configuration
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0

" backspace
set bs=2 " make backspace behave like normal
" strange letters bug (>4;2m)
let &t_TI = ""
let &t_TE = ""

" remove whitesspaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TICKTRONAUT
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

"keybindings
" NERDTree keyboard bindings
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <F7> :NERDTreeToggle<CR>
" TagBar keyboard bindings"
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
" UndoTree keyboard binding
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>r :QuickRun<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" resize bindings
"nnoremap <silent> <leader>+ :vertical resize +5<CR>
"nnoremap <silent> <leader>- :vertical resize -5<CR>
"

fun GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tappage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>ddd <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" YCM autocomplete bindings
nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
nmap <leader>n <plug>(YCMHover)
" show hover command of YouCompleteMe

""let g:airline_section_x = airline#section#create(
""  \ ['%{youcompleteme#GetCommandResponse("GetType")}']
""  \)

"" -> this slows down vim:
""fun GetYCMType()
""    let ret = youcompleteme#GetCommandResponse("GetType")
""
""    if ret == "Internal error: cursor not valid"
""        return ""
""    elseif ret == "Unknown type"
""        return ""
""    else
""        return ret
""    endif
""endfun
""let g:airline_section_x = airline#section#create('%{GetYCMType()}')

""augroup YCMHover
""  autocmd!
""  autocmd FileType c,cpp let b:ycm_hover = {
""    \ 'command': 'GetType',
""    \ 'syntax': &filetype
""    \ }
""augroup END

