" xghost.nvim - A minimalist, macOS-inspired Neovim theme
" Maintainer: qdrtech
" License: MIT

" Check for Neovim 0.5+
if !has('nvim-0.5')
  echohl ErrorMsg
  echom 'xghost.nvim requires Neovim 0.5 or higher'
  echohl None
  finish
endif

" Load the Lua theme
lua require('xghost').load()
