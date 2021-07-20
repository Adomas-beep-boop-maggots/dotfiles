" Description: Keymaps

" Space leader key
let mapleader=" "

" Place last yank
nnoremap <Bslash>p "0p

" Delete without yank
nnoremap <Bslash>x "_x
nnoremap <Bslash>d "_d
nnoremap <Bslash>c "_c

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Copy/Paste clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Shortcut for saving the file
nnoremap <C-S> :update<cr>
inoremap <C-S> <Esc>:update<cr>gi

" Spawn python thing
autocmd FileType python map <buffer> <Leader>r :botright split term://python3 %

" Select all
" nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

"-----------------------------
" Tabs

" Open current directory
" nmap te :tabedit 
" nmap <S-Tab> :tabprev<Return>
" nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
" nmap ss :split<Return><C-w>w
" nmap sv :vsplit<Return><C-w>w
" Move window
" nmap <Space> <C-w>w
" map s<left> <C-w>h
" map s<up> <C-w>k
" map s<down> <C-w>j
" map s<right> <C-w>l
" map sh <C-w>h
" map sk <C-w>k
" map sj <C-w>j
" map sl <C-w>l
" Resize window
" nmap <C-w><left> <C-w><
" nmap <C-w><right> <C-w>>
" nmap <C-w><up> <C-w>+
" nmsp <C-w><down> <C-w>-

tnoremap <C-w> <C-\><C-N><C-w>
tnoremap <C-w><esc> <C-\><C-N>
tnoremap <C-w><esc> <C-\><C-N>
