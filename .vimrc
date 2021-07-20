" Some basic settings to make life easyer
syntax on
set mouse=a
"set clipboard=unnamed
set showcmd
set number relativenumber
inoremap jj <ESC>
" escape is too hard to reach ):
noremap <Leader>y "+y
noremap <Leader>p "+p
" global register is also hard to reach ):
set hlsearch
set is hls
set formatoptions=tcqjor
filetype plugin on
set path+=**
set wildmenu
"settings from neovim vim-diff
set autoindent
set autoread
set langnoremap
set nolangremap
set laststatus=2
set nostartofline
set ttimeoutlen=40
set path+=**
"set t_ti= t_te=
"set t_TI=
" some nice config from $VIMRUNTIME/defaults
" map Q gq
" set display=truncate
set history=200		" keep 200 lines of command line history
set scrolloff=5
" set complete+=kspell
" set completeopt+=menuone,longest
" set shortmess+=c
" inoremap <expr> <Tab> pumvisible() ? "<C-y>" : "<Tab>"
" lines to save view
autocmd BufWinEnter *.* silent loadview
autocmd BufWinLeave *.* mkview


if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif


map <silent> <F2> :botright terminal<CR><C-\><C-n>:set nonumber norelativenumber<CR>i
map <silent> <F4> :Lex<CR>

"lol
"kaka
"icup
"means i see you pee$ dasf $ faofijwoe jwaej$

let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_winsize=25
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" croql
" Command binds:
" Wipe all registers 
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Python binds/commands: 
" F3 - spawns python shell 
" F12 - executes current python script and shows an output
" More convenient binds for saied python shell
autocmd FileType python map <buffer> <F3> :botright terminal python3<CR><C-\><C-n>:set nonumber norelativenumber<CR>i
"autocmd FileType python imap <buffer> <F12> <esc>:w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
"autocmd FileType python map <buffer> <F12> :w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
"
"autocmd FileType python map <buffer> <F12> :w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>"autocmd FileType python map <buffer> <F12> :w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
"
autocmd FileType python imap <buffer> <F12> <esc>:w<CR>:!python3 %<CR>
autocmd FileType python map <buffer> <F12> :w<CR>:!python3 %<CR>
autocmd FileType python tnoremap <C-W> <C-\><C-n><C-W>
autocmd FileType python tnoremap <C-D> <C-\><C-n>:q!<CR>

" C++ binds/commands:
" WIP
" set makeprg=gcc\ %
" map <F4> :w\|mak\|cw<CR>

" Fancy syntax and color stuff:
" change to light theme, makes text more readable
" ~/.config/i3/config has colors now wow
colorscheme PaperColor
set background=light
set t_Co=256   " This is may or may not needed.
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
"set termguicolors

let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_floating_window_border = []
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_set_signs = 0
let g:ale_echo_msg_format = '[%linter%] %s [%code%]'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
nmap <F8> <Plug>(ale_fix)

" Plugins
" Theme Plugins
" call plug#begin('~/.vim/plugged')
" Plug 'ap/vim-css-color'
" Plug 'dense-analysis/ale'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-repeat'
" Plug 'Yggdroot/indentLine'
" Plug 'tpope/vim-commentary'
call plug#end()

" Plug 'ervandew/supertab'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Vim script graveyard
" press ZZ to pay respects ):
"
" Plug 'vim-scripts/AutoComplPop'
" packadd! dracula
" colorscheme dracula
" bind F12 to compile and show output of python scripts.
" first bind is for normal mode and second is for insert mode
" autocmd FileType python tnoremap <C-D> <C-D>:q!<CR>
" autocmd FileType python tnoremap <C-D> <C-\><C-n>:q!<CR>
" autocmd FileType python tnoremap <esc> <C-\><C-n>
" tnoremap
" for .config/i3/config syntax
" hi Terminal ctermbg=lightgrey
" hi Terminal ctermbg=darkgrey
" set termguicolors
" hi terminal ctermfg=2 ctermbg=16
" hi terminal ctermfg=2 
" noremap <Leader>y "+y
" noremap <Leader>p "+p
"map zy "+y
"map zp "+p
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
