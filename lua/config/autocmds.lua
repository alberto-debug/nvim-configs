-- Auto-format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = lsp_fmt_group,
  callback = function(args)
    -- Get active clients for the current buffer
    local clients = vim.lsp.get_clients({ bufnr = args.buf })

    if #clients == 0 then return end

    -- Prioritized list of formatters
    local preferred_formatters = {
      "lua_ls",        -- for Lua
      "tsserver",      -- for JavaScript/TypeScript
      "gopls",         -- for Go
      "rust_analyzer", -- for Rust
      -- Add more language-specific formatters here
      "efm",           -- as a fallback generic formatter
      -- nil -- as a last resort, try any available formatter
    }

    local formatter_to_use = nil
    for _, formatter in ipairs(preferred_formatters) do
      for _, client in ipairs(clients) do
        if client.name == formatter then
          formatter_to_use = formatter
          break
        end
      end
      if formatter_to_use then break end
    end

    vim.lsp.buf.format({
      async = false,
      name = formatter_to_use, -- Will be nil if no preferred formatter found
      timeout_ms = 5000,
      bufnr = args.buf
    })
  end,
})


--markdown autoformatting
vim.api.nvim_create_augroup("Markdown", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.textwidth = 101
  end,
  group = "Markdown",
})
