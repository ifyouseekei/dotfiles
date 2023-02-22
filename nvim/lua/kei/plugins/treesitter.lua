-- configure treesitter
require("nvim-treesitter.configs").setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = "all",
	-- auto install above language parsers
	auto_install = true,
})
