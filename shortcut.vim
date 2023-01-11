" ===
" all files
" ===
augroup mine | autocmd FileType * nnoremap K 8k
augroup mine | autocmd FileType * nnoremap J 8j
augroup mine | autocmd FileType * nnoremap H 3b
augroup mine | autocmd FileType * nnoremap L 3w
augroup mine | autocmd FileType * nnoremap ( 0
augroup mine | autocmd FileType * nnoremap ) $
augroup mine | autocmd FileType * nnoremap ` ~
augroup mine | autocmd FileType * nnoremap ;v S<Esc>
augroup mine | autocmd FileType * inoremap ;v <Esc>S<Esc>
augroup mine | autocmd FileType * nnoremap ;r S
augroup mine | autocmd FileType * inoremap ;r <Esc>S
augroup mine | autocmd FileType * nnoremap <leader>c :!
augroup mine | autocmd FileType * nnoremap <leader>e :e<Space>~/
augroup mine | autocmd FileType * nnoremap ;f /<++><CR>:nohlsearch<CR>c4l<Esc>
augroup mine | autocmd FileType * vnoremap Y :w !xclip -i -sel c<CR><CR>
augroup mine | autocmd FileType * inoremap <c-h> <BS><BS><BS><BS><BS>
augroup mine | autocmd FileType * nnoremap . @a


" ===
" vim
" ===
augroup mine | autocmd FileType vim nnoremap ;c ^i"<Esc>
augroup mine | autocmd FileType vim nnoremap ;s /shortcut.vim<CR>:nohlsearch<CR>
augroup mine | autocmd FileType vim nnoremap { ^w
augroup mine | autocmd FileType vim nnoremap } $h
cnoreabbrev q quit!
cnoreabbrev pi PlugInstall
cnoreabbrev pu PlugUpdate
cnoreabbrev pc PlugClean
