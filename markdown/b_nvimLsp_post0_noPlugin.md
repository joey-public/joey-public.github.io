# Setting up a C/C++ LSP in NeoVim with No Plugin Manager

Here are the steps to get the clangd lsp up and running with neovim if you are using ubuntu linux like I am.

1. Download the [latest release](https://github.com/clangd/clangd/releases/tag/18.1.3) of the clangd LSP from GitHub
1. Unzip it in your home directory,  This command should work on ubuntu `unzip ~/Downloads/clangd-linux-18.1.3/ -d ~/lsp`
1. Install the `nvim-lspconfig` [package](https://github.com/neovim/nvim-lspconfig) directly with git: `git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig` 
1. At the bottom of your `~/.config/nvim/init.lua` add this code copied from the [clangd website](https://clangd.llvm.org/installation)

```
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
  name = 'clangd',
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  initialization_options = {
    fallback_flags = { '-std=c++17' },
  },
})
```

That is it. Now when you open a C or C++ file in nvim you should see:

- Warning and Error Messages By default
- Better Syntax Highlighting
- Working omni competition with `<C-x><C-o>` while typing in insert mode 
- Working go to definitions with `<C-]>` and back with `<C-t>`
- Working Fucntion Definition Popups `K` in normal mode, `<C-ww>` to enter the popup window

There are more features, but those are basically 99% of what I want to do. 

The only issue at this point is that you may have some bogus error messages about some of your header files. You can see the [Project Setup](https://clangd.llvm.org/installation) documentation.

The Screenshots below show what my Neovim looked like before and after following these instructions. 
