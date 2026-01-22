local M = {}
local palette = require("gruvbox-retro.palette").colors

function M.setup()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "gruvbox-retro"

	local c = palette
	local set_hl = function(g, o)
		vim.api.nvim_set_hl(0, g, o)
	end

	-- Base
	set_hl("Normal", { fg = c.fg, bg = c.bg })
	set_hl("NormalFloat", { fg = c.fg, bg = c.bg_float })
	set_hl("FloatBorder", { fg = c.bg_visual, bg = c.bg_float })
	set_hl("Cursor", { fg = c.bg, bg = c.fg })
	set_hl("CursorLine", { bg = c.bg_highlight })
	set_hl("LineNr", { fg = c.bg_visual })
	set_hl("CursorLineNr", { fg = c.yellow, bold = true })
	set_hl("Visual", { bg = c.bg_visual })
	set_hl("SignColumn", { bg = c.bg })
	set_hl("StatusLine", { fg = c.fg_light, bg = c.bg_dark })

	-- Syntax
	set_hl("Comment", { fg = c.fg_dim, italic = true })
	set_hl("String", { fg = c.green })
	set_hl("Function", { fg = c.bright_green, bold = true })
	set_hl("Keyword", { fg = c.red })
	set_hl("Conditional", { fg = c.red })
	set_hl("Type", { fg = c.yellow })
	set_hl("Constant", { fg = c.bright_mag })
	set_hl("Variable", { fg = c.fg })
	set_hl("Identifier", { fg = c.blue })
	set_hl("MatchParen", { bg = c.bg_visual, fg = c.bright_yellow })

	-- Treesitter
	set_hl("@variable", { fg = c.fg })
	set_hl("@property", { fg = c.blue })
	set_hl("@field", { fg = c.blue })
	set_hl("@parameter", { fg = c.fg })
	set_hl("@constructor", { fg = c.yellow })

	-- UI Plugins
	set_hl("TelescopeNormal", { bg = c.bg_dark })
	set_hl("TelescopeBorder", { fg = c.bg_visual, bg = c.bg_dark })
	set_hl("GitSignsAdd", { fg = c.green })
	set_hl("GitSignsChange", { fg = c.blue })
	set_hl("GitSignsDelete", { fg = c.red })
end

return M
