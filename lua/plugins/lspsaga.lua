local config = function()
	require("lspsaga").setup({})
end

return {
	"nvimdev/lspsaga.nvim",
	config = config,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	event = "LspAttach",
}
