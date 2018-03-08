"   __  __ _ _____ _________
"   \ \ | |_|     V  __/  __|
"    \ \| | | | | | |  | [__
" [_] \___|_|_|_|_|_|  \____|

syntax on
colorscheme molokai

" Syntax highlight for java
let java_highlight_all=1

set t_Co=256
set nobackup        " Don't make backup file
set noundofile      " Don't make `.un~` file
set noswapfile      " Automatically reread when the file being edited is changed
set number          " Show line number
set ignorecase      " Ignore case on search
set showmatch       " Hylights correspond parentheses
set expandtab       " Replace tab input with blank
set tabstop=4       " Width occupied by tab characters
set shiftwidth=4    " Width displaced by automatic indentation
set softtabstop=4   " Width at which the cursor moves with tab and backspace for consecutive blanks
set autoindent      " Maintain indentation of previous line at line feed
set smartindent     " Increase or decrease the indent of the next line according to the end of the line entered at line feed
set visualbell      " Visualize beep
set laststatus=2    " Always show statusline
set cursorline      " Hylights cursorline (line)
set cursorcolumn    " Hylights cursorline (column)
set clipboard=unnamed,autoselect " Share clipboard
set completeopt=menuone
"---Auto correct---
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
    exec "imap " . k . " " . k . "<C-N><C-P>"
    endfor
    
    imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"
"------------

"---Visualize 2 byte character space.---
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
"--------------------------

"Highlights status-line when edit mode is valid.=======-
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
"--------------------------------------

"====================Plugins=====================
"---dein.vim---
"if &compatible
"    set nocompatible
"endif
"set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
"
"call dein#begin(expand('~/.vim/dein'))
"
"call dein#add('Shougo/dein.vim')
"call dein#add('Shougo/neocomplete.vim')
"call dein#add('scrooloose/nerdtree')
"call dein#add('nathanaelkane/vim-indent-guides')
"
"call dein#end()
"
"filetype plugin indent on
"syntax enable
""--------------
"
""---vim-indent-guides---(https://github.com/nathanaelkane/vim-indent-guides)
"" Enable vim-indent-guides on vim startup.
"let g:indent_guides_enable_on_vim_startup = 1
"" Specify filetypes that vim-indent-guides exclude. (Values: list of strings)
"let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
""-----------------------
