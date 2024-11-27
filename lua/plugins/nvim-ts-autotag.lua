return {
	"windwp/nvim-ts-autotag",
	lazy = false,
	opts = {},
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				filetypes = {
					"html",
					"xml",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"svelte",
					"vue",
				},
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})
	end,
}
