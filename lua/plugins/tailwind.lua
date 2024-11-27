return {
  "luckasRanarison/tailwind-tools.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    "neovim/nvim-lspconfig",         -- optional
  },
  ft = {
    "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte"
  },
  opts = {
    -- Your configuration options here
  },
  config = function(_, opts)
    require("tailwind-tools").setup(opts)
  end,
}
