local config = function()
	vim.cmd([[ hi StatusLine ctermbg=0 cterm=NONE]])
	require("transparent").setup({
		--Optional, you don't have to run setup
		groups = {
			"Normal",
			"NormalNC",
			"Comment",
			"Constant",
			"Special",
			"Identifier",
			"Statement",
			"PreProc",
			"Type",
			"Underlined",
			"Todo",
			"String",
			"Function",
			"Conditional",
			"Repeat",
			"Operator",
			"Structure",
			"LineNr",
			"NonText",
			"SignColumn",
			"CursorLineNr",
			"EndOfBuffer",
		},
		extra_groups = {
			"NormalFloat",
			"TablineFill",
		},
		exclude_groups = {},
	})
end

return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = config,
}
