set encoding=utf-8
set clipboard=unnamedplus
set relativenumber

execute pathogen#infect()
syntax on
filetype plugin on

noremap ů :
map <space> <leader>
map U <C-r> 
nnoremap <ESC> :noh<CR>
nnoremap J 10gj
nnoremap K 10gk
nnoremap <leader>l :w<CR>:!latexmk --pdf<CR>
nnoremap <leader>r :w<CR>:!g++ % -o torun && ./torun < 
nnoremap <leader>i <C-a>
vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
inoremap <C-space> <Esc>/<++><Enter>"_c4l
map <space><Tab> <Esc>/<++><Enter>"_c4l
imap <C-d> <C-w> 
map <C-a> <esc>ggVG<CR>
inoremap <C-e> }<ESC>yBi\end{<ESC>O\begin{<ESC>pa}
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
