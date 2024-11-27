local config = function()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })

  require("mason-lspconfig").setup({
    -- Automatically install LSP servers
    automatic_installation = true,
    ensure_installed = {
      -- LSP Servers
      "lua_ls",
      "rust_analyzer",
      "jsonls",
      "pyright",
      "ts_ls",
      "bashls",
      "emmet_ls",
      "dockerls",
      "clangd",
      "intelephense",
      "gopls",
      "jdtls",
    },
  })

  -- Ensure formatters and linters are installed
  require("mason-null-ls").setup({
    automatic_installation = true,
    ensure_installed = {
      -- Formatters
      "stylua",
      "black",
      "prettier",
      "fixjson",
      "shfmt",
      "clang-format",
      "rustfmt",
      "gofumpt",
      "google-java-format",

      -- Linters
      "luacheck",
      "flake8",
      "eslint_d",
      "shellcheck",
      "hadolint",
      "cpplint",
      "golangci-lint",
    },
  })
end

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jay-babu/mason-null-ls.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = config,
}
