return {

	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = function()
			local config = require("nvchad.configs.nvimtree")
			return vim.tbl_deep_extend("force", config, require("configs.nvimtree"))
		end,
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- Lua
				"lua-language-server",
				"stylua",
				-- Go
				"gopls",
				"delve",
				"golines",
				"gofumpt",
				"goimports-reviser",
				-- Java
				"jdtls",
				"java-debug-adapter",
				"java-test",
				-- Others
				"html-lsp",
				"css-lsp",
				"prettier",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"go",
				"markdown",
				"bash",
				"html",
				"css",
				"java",
			},
		},
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	{
		"vimtools/none-ls.nvim",
		ft = "go",
		opts = function()
			return require("configs.null-ls")
		end,
	},

	{
		"mfussenegger/nvim-dap",
		init = function()
			require("mappings.dap").load_mappings()
		end,
	},

	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
			require("mappings.go.dap-go").load_mappings()
		end,
	},

	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
			require("mappings.go.gopher").load_mappings()
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},

	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		dependencies = "hrsh7th/cmp-nvim-lsp",
		config = function()
			require("configs.jdtls").setup()
		end,
	},

	{
		dir = "/home/aaronv/development/lua/plugins/gmode",
	},
}
