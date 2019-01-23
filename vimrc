syntax on
filetype plugin indent on   " show existing tab with 4 spaces width
set tabstop=4               " when indenting with '>', use 4 spaces width
set shiftwidth=4            " On pressing tab, insert 4 spaces
set expandtab               " Convert tabs to spaces
set number                  " Display lines numbers
set smartindent             " Puts one level of indent
set autoindent              " Keep the last line identation
set ruler                   " Display the cursor position
set mouse=a                 " Allow to use the mouse
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set list
set listchars=tab:>-,trail:\.
