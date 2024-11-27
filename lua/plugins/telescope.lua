local keymap = vim.keymap

local telescope_setup = function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-k>"] = "move_selection_previous",
          ["<C-j>"] = "move_selection_next",
        },
      },
    },
  })
end

local set_keys = function()
  keymap.set("n", " <leader>fh", ":Telescope help_tags<CR>")
  keymap.set("n", " <leader>ff", ":Telescope find_files<CR>")
  keymap.set("n", " <leader>fa", ":Telescope <CR>")
  keymap.set("n", " <leader>fg", ":Telescope live_grep<CR>")
  keymap.set("n", " <leader>fb", ":Telescope buffers<CR>")
end

local config = function()
  telescope_setup()
  set_keys()
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = config,
}
