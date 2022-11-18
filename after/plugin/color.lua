local present, catppuccin = pcall(require, "catppuccin")
if not present then return end

catppuccin.setup {
    flavor = 'mocha', -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
    color_overrides = {
		latte = {base = "#E1EEF5"},
		mocha = {base = "#0C0C0C"}
	},
    integrations = {
		treesitter = true,
		nvimtree = true,
		dap = {enabled = true, enable_ui = true},
		lsp_saga = true,
		neogit = true,
	},
}

vim.opt.background = "dark"
vim.cmd("colorscheme catppuccin")
