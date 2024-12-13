# Setting up and using different LSPs in neovim with no Plugins

## TLDR: Setup C/C++ and lua LSP in 5 min with No plugins

First cheat and install a single plugin manually with this terminal command:

```
git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig
```

To install clang and configure neovim to work with it:

1. Download the [latest release](https://github.com/clangd/clangd/releases/tag/18.1.3) of the clangd LSP from GitHub
1. Unzip it in your home directory,  This command should work on ubuntu `unzip ~/Downloads/clangd-linux-18.1.3/ -d ~/lsp`
1. At the bottom of your `~/.config/nvim/init.lua` add this code copied from the [clangd website](https://clangd.llvm.org/installation)

```lua
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
  name = 'clangd',
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  initialization_options = {
    fallback_flags = { '-std=c++17' },
  },
})
```

To install lua_ls and configure neovim to work with it:

1. Install the `lua-language-server` following the neovim instructions found [here](https://luals.github.io/#neovim-installhttps://luals.github.io/#neovim-install)
1. At the bottom of your `~/.config/nvim/init.lua` add this code copied from the same instructions

```
require'lspconfig'.lua_ls.setup{}
```

## Introduction

By far the biggest issue I have run into with neovim is how complicated setting up auto-completion can feel. In order of importance to me here are the things I want to be able to do inside of neovim that an LSP will help me with.

1. **function definitions**: I want to use `<shift-k>` in normal mode to have a window pop-up with the function definition and arguments for the function my cursor is currently over.
1. **jump to definition**: I want to use the `<ctrl-]>` shortcut in normal mode to jump to the definition of the function that my cursor is currently over. And use `<ctrl-t` to jump back.
1. **omni-complete**: I want to press `<ctrl-x><ctrl-o>` in insert mode to get omni-completions for the functions/parameters or whatever that are available in a module/class. 

As far as I can tell there are 2 ways to achieve what I want. 

1. nvim-lsp 
1. universal-ctags

I want to try both of these eventually, but for this post focuses on a plugin-free way of using the built in neovim lsp support to achieve my 3 goals for (hopefully) any language.

### I Lied We Want One Plugin

When I said no plugins I really meant no plugin manager.

In the past when I tried to follow tutorials on lsp setup in neovim, they always being the same way. "First Install <insert whatever is the cool new plugin manager>". No. I don't wanna. I just want these 3 simple things. What the fuck is lazy loading. I just want to write my code. I don't care if my neovim takes 30ms instead of 10ms to open. Then the tutorial goes on to install like 6 plugins just for these 3 features that are already like 95% built into vim. 

All I need for what I want to achieve is a single plugin `nvim-lspconfig`, and dammit I don't need a package manager to do it. I can read. Well actually Im not that good at reading, but I can copy and paste a single command from the `nvim-lspconfig` [repository](https://github.com/neovim/nvim-lspconfig)

To install the `nvim-lspconfig` plugin without any plugin manager use this one terminal command. 

```
git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig
```

The `~/.config/nvim/pack/` directory is in neovim `runtimepath` and is where neovim will look to load packages on startup. Or something like that idk, its all explained if you type `:help packages` inside of neovim. The main thing is you cannot just clone the `nvim-lspconfig` repo anywhere and expect neovim to know where that shit is.

With this one plugin our neovim is all setup to run any LSP we want to use. 

### Setting up clangd LSP for C/C++ auto-completion

Now neovim is all setup to act as a client to any Language Server you may want to use, but we still need to install the language server. The language server is just some other program you run on your computer that neovim can imitate and talk to. Idk read `:help lsp` fo an actual explination.

One popular language server is `clangd` which can be used for the C/C++ programming language. You can install it and get my 3 golden features in just 3 steps:

1. Download the [latest release](https://github.com/clangd/clangd/releases/tag/18.1.3) of the clangd LSP from GitHub
1. Unzip it in your home directory,  This command should work on ubuntu `unzip ~/Downloads/clangd-linux-18.1.3/ -d ~/lsp`
1. At the bottom of your `~/.config/nvim/init.lua` add this code copied from the [clangd website](https://clangd.llvm.org/installation)

```lua
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
  name = 'clangd',
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  initialization_options = {
    fallback_flags = { '-std=c++17' },
  },
})
```

Note 0: This config is so simple thanks the `nvim-lspconfig` plugin that is being required in the first line. You don't technically need the plugin, you could figure out how to configure neovim to talk to clangd. See `:help lsp` if you want to deal with that.

Note 1: You could also organize this better then just having it in your `~/.config/nvim/.init.lua` file, but thats not the point of the post. The point is this works.  

Now if you close neovim and open up a C or C++ file you should have all the nice LSP Features working. 

### Setting up lua_ls LSP for lua autocompletion

Unsurprisingly we can setup autocompletion for lua files in a similar fashion. 

1. Install the `lua-language-server` following the neovim instructions found [here](https://luals.github.io/#neovim-installhttps://luals.github.io/#neovim-install)
1. At the bottom of your `~/.config/nvim/init.lua` add this code copied from the same instructions

```
require'lspconfig'.lua_ls.setup{}
```

Note 1: You need to make sure you can run the `lua-language-server` command from the command line. For me I had to add the path to my $PATH variable. 

Note 2: lua table indexing starts at 1.
