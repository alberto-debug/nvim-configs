return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup {}

    -- Mapeamento de teclas
    vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>") -- Ctrl+n
    vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")     -- Sinal de + para abrir/fechar

    vim.keymap.set("n", "<Leader>o", ":NvimTreeFocus<CR>")      -- Sinal de + para focar no tree
  end,
}

