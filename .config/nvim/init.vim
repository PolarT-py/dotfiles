" Setting variables
:set number

:set autoindent
:set tabstop=4
:set smarttab
:set softtabstop=4

:set mouse=a


" Plugins
call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/windwp/nvim-autopairs'
Plug 'https://github.com/akinsho/toggleterm.nvim'
Plug 'https://github.com/numToStr/Comment.nvim'
Plug 'https://github.com/akinsho/bufferline.nvim'

call plug#end()


" Keybinds
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-z> :undo<CR>
nnoremap <C-y> :redo<CR>
nnoremap <C-q> :q<CR>


" Plugins config

