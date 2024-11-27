local config = function()
  require("nvim-treesitter.configs").setup({
    build = ":TSUpdate",
    indent = {
      enable = true,
    },

    event = {
      "BufReadPre",
      "BufNewFile",
    },
    ensure_installed = {
      "rust",
      "markdown",
      "json",
      "javascript",
      "typescript",
      "yaml",
      "html",
      "css",
      "bash",       -- Removed duplicate "markdown"
      "lua",
      "dockerfile",
      "gitignore",
      "python",
      "vue",
      "svelte",
      "toml",
      "markdown_inline",
      "regex",
      "jsonc",
      "vimdoc",
      "vim",
      "go",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-s>",
        node_incremental = "<C-s>",
        scope_incremental = false,
        node_decremental = "<BS>",
      },
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = config,
}
