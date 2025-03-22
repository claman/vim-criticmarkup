if exists('b:loaded_critic_vim') | finish | endif
let b:loaded_critic_vim = 1

augroup criticmarkup
    autocmd!
    autocmd Filetype pandoc,markdown,mkd,text,vimwiki call criticmarkup#Init()
    autocmd Syntax pandoc,markdown,mkd,text,vimwiki call criticmarkup#InjectHighlighting()
    " The unorthodox way this plugin injects new syntax rules is broken in
    " Neovim which takes a different approach to initializing the GUI (which
    " is an optional component rather than an assumed part of the system). As
    " a result we don't get initialized at all unless the user happens to
    " set filetype a second time after initial loading or loads a buffer after
    " the GUI is loaded. This hack sidesteps that and makes sure we get a
    " chance to get started. See https://github.com/neovim/neovim/issues/2953
    if has('nvim')
        autocmd VimEnter * doautoa Syntax,Filetype
    endif
augroup END

nmap ]m :call criticmarkup#JumpNext(0)<CR>
nmap [m :call criticmarkup#JumpPrevious(0)<CR>

nnoremap <buffer> <localleader>ed :set operatorfunc=CMDelOperator<cr>g@
vnoremap <buffer> <localleader>ed :<c-u>call CMOperator(visualmode(),'<','>','{--','--}')<cr>
nnoremap <buffer> <localleader>ea :set operatorfunc=CMAddOperator<cr>g@
vnoremap <buffer> <localleader>ea :<c-u>call CMOperator(visualmode(),'<','>','{++','++}')<cr>
nnoremap <buffer> <localleader>eh :set operatorfunc=CMHilOperator<cr>g@
vnoremap <buffer> <localleader>eh :<c-u>call CMOperator(visualmode(),'<','>','{==','==}')<cr>
nnoremap <buffer> <localleader>ec :set operatorfunc=CMComOperator<cr>g@
vnoremap <buffer> <localleader>ec :<c-u>call CMOperator(visualmode(),'<','>','{>>','<<}')<cr>
nnoremap <buffer> <localleader>es :set operatorfunc=CMSubOperator<cr>g@
vnoremap <buffer> <localleader>es :<c-u>call CMOperator(visualmode(),'<','>','{~~','~>~~}')<cr>
