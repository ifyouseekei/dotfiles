vim.cmd([[packadd packer.nvim]])

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager
	use({ "srcery-colors/srcery-vim", as = "srcery" })
	use("olimorris/onedarkpro.nvim")
	use("christoomey/vim-tmux-navigator") -- tmux shortcut for split screen

	use("mbbill/undotree") -- undo tree

	use("szw/vim-maximizer") -- maximize split screen

	use("tpope/vim-surround") -- vim surround
	use("tpope/vim-unimpaired") -- shortcuts using brackets
	use("tpope/vim-sleuth") --
	use("tpope/vim-repeat") --

	use("nelstrom/vim-visual-star-search") -- pasting shortcut
	use("vim-scripts/ReplaceWithRegister") -- pasting shortcut

	use("numToStr/Comment.nvim") -- comment with gcc

	use({
		"nvim-tree/nvim-tree.lua", -- file explorer
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- bufferline
	use({
		"akinsho/bufferline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		after = "onedarkpro.nvim",
		config = function()
			require("bufferline").setup({
				options = {
					offsets = {
						{
							filetype = "NvimTree",
							text = "📁 Files",
							highlight = "StatusLine",
						},
					},
				},
			})
		end,
	})

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})

	-- Tree sitter syntax highlighting
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- terminal
	use({
		"voldikss/vim-floaterm",
		config = function()
			vim.keymap.set("n", "<F1>", ":FloatermToggle<CR>")
			vim.keymap.set("t", "<F1>", "<C-\\><C-n>:FloatermToggle<CR>")
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
