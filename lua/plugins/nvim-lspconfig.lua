---@diagnostic disable: missing-fields

local on_attach = require("util.lsp").on_attach

local config = function()
  require("neoconf").setup({})
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  local lspconfig = require("lspconfig")

  local signs = { Error = "❌", Warn = "⚠️", Hint = "💡", Info = "ℹ️" }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local capabilities = cmp_nvim_lsp.default_capabilities()

  -- Lua
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.stdpath("config") .. "/lua",
          },
        },
      },
    },
  })

  -- Rust
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "rust" },
    settings = {
      rust = {
        analyzer = {
          cargo = true,
          clippy = true,
        },
        completion = {
          workspace = {
            crates = true,
            dependencies = true,
          },
        },
      },
    },
  })

  -- JSON
  lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "json", "jsonc" },
  })

  -- Python
  lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
      "python",
    }
  })

  -- TypeScript
  lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "javascript",
    },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
  })

  -- Bash
  lspconfig.bashls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "sh", "aliasrc" },
  })

  -- Emmet for Web Technologies
  lspconfig.emmet_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
      "typescriptreact",
      "javascriptreact",
      "css",
      "sass",
      "scss",
      "less",
      "svelte",
      "vue",
      "html",
    },
  })

  -- Docker
  lspconfig.dockerls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "docker" }
  })

  -- C/C++
  lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  })

  -- PHP
  lspconfig.intelephense.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "php" },
  })

  -- Go
  lspconfig.gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "go" },
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  })

  -- Java
  lspconfig.jdtls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "java" },
    settings = {
      java = {
        signatureHelp = { enabled = true },
        maven = {
          downloadSources = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        inlayHints = {
          parameterNames = {
            enabled = 'all', -- literals, all, none
          },
        },
        format = {
          enabled = false,
        },
      },
    },
  })

  -- Configure EFM Language Server manually with linters and formatters
  lspconfig.efm.setup({
    filetypes = {
      "lua", "python", "json", "jsonc", "sh", "javascript", "typescript",
      "typescriptreact", "vue", "html", "css", "go", "rust", "java"
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      languages = {
        lua = {
          { name = "luacheck", command = "luacheck", args = { "--formatter", "plain", "--codes", "-" }, rootPatterns = { ".luacheckrc" } },
          { name = "stylua",   command = "stylua",   args = { "--config-path", ".stylua.toml", "-" },   rootPatterns = { ".stylua.toml" } },
        },
        python = {
          { name = "flake8", command = "flake8", args = { "--max-line-length", "79", "--ignore", "E501", "-" }, rootPatterns = { ".flake8" } },
          { name = "black",  command = "black",  args = { "--line-length", "79", "-" },                         rootPatterns = { "pyproject.toml" } },
        },
        javascript = {
          { name = "eslint",   command = "eslint_d", args = { "--stdin", "--stdin-filename", "%filename" },       rootPatterns = { ".eslintrc.json", ".eslintrc.js", ".eslint.json" } },
          { name = "prettier", command = "prettier", args = { "--stdin", "--parser", "babel", "--single-quote" }, rootPatterns = { ".prettierrc" } },
        },
        typescript = {
          { name = "eslint",   command = "eslint_d", args = { "--stdin", "--stdin-filename", "%filename" },            rootPatterns = { ".eslintrc.json", ".eslintrc.js", ".eslint.json" } },
          { name = "prettier", command = "prettier", args = { "--stdin", "--parser", "typescript", "--single-quote" }, rootPatterns = { ".prettierrc" } },
        },
        go = {
          { name = "golangci-lint", command = "golangci-lint", args = { "run", "--out-format", "json", "-" }, rootPatterns = { ".golangci.yml", ".golangci.toml" } },
          { name = "gofmt",         command = "gofmt",         args = { "-" },                                rootPatterns = { ".go" } },
        },
        rust = {
          { name = "rustfmt", command = "rustfmt", args = { "-" } },
        },
        java = {
          { name = "google-java-format", command = "google-java-format", args = { "--replace", "-" } },
        },
      },
    },
  })

  -- Diagnostics Configuration
  vim.diagnostic.config({
    virtual_text = true,     -- Shows error messages directly in code
    signs = true,            -- Show error icons in the gutter
    update_in_insert = true, -- Update diagnostics while in insert mode
    underline = true,        -- Underline the parts of the code with errors
    severity_sort = true,    -- Sort diagnostics by severity
  })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
}
