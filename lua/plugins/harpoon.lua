return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>a", function() require("harpoon.mark").add_file() end,        desc = "Harpoon: Mark File" },
    { "<C-e>",     function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon Menu" },
    { "<C-t>",     function() require("harpoon.ui").nav_file(1) end,         desc = "Harpoon File 1" },
    { "<C-s>",     function() require("harpoon.ui").nav_file(2) end,         desc = "Harpoon File 2" },
    { "<C-b>",     function() require("harpoon.ui").nav_file(3) end,         desc = "Harpoon File 3" },
    { "<C-g>",     function() require("harpoon.ui").nav_file(4) end,         desc = "Harpoon File 4" },
  },
  opts = {
    -- You can add any Harpoon configuration options here
  },
}
