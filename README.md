# lazy.nvim Configuration

This repository contains my personal lazy.nvim configuration. It is set up to enhance productivity and ease of use.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Prerequisites

- Neovim >= 0.8.0 (needs to be built with LuaJIT)
- Git >= 2.19.0 (for partial clones support)
- A Nerd Font (optional)

### Installation

You can add the following Lua code to your `init.lua` to bootstrap lazy.nvim:

```lua
local lazypath = vim.fn.stdpath ("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat (lazypath) then
 vim.fn.system ( {
 "git",
 "clone",
 "--filter=blob:none",
 "https://github.com/folke/lazy.nvim.git",
 "--branch=stable", -- latest stable release
 lazypath,
 })
end
vim.opt.rtp:prepend (lazypath)
```

Next step is to add lazy.nvim below the code added in the prior step in `init.lua`:

```lua
require ("lazy").setup (plugins, opts)
```

- `plugins`: this should be a `table` or a `string`
    - `table`: a list with your Plugin Spec
    - `string`: a Lua module name that contains your Plugin Spec.

Please replace `plugins` and `opts` with your actual plugin specifications and options.
