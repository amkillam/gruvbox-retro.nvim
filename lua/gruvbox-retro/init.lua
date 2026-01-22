local M = {}

local palette = require("gruvbox-retro.palette").colors

function M.setup()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
	vim.o.background = "dark"
	vim.g.colors_name = "gruvbox-retro"

	local c = palette
	local set_hl = function(g, o)
		vim.api.nvim_set_hl(0, g, o)
	end

	local groups = {
		-- Base & Editor
		Normal = { fg = c.fg, bg = c.bg },
		NormalFloat = { fg = c.fg, bg = c.bg_float },
		FloatBorder = { fg = c.accent, bg = c.bg_float },
		Cursor = { fg = c.bg, bg = c.fg },
		CursorLine = { bg = c.bg_highlight },
		CmdLine = { fg = c.fg, bg = c.bg_float },
		SpecialKey = { fg = c.fg_dim },
		Pmenu = { fg = c.fg, bg = c.bg_float },
		PmenuSel = { fg = c.bg, bg = c.accent, bold = true },
		Visual = { bg = c.bg_visual },
		Search = { fg = c.bg, bg = c.yellow },
		IncSearch = { fg = c.bg, bg = c.accent },
		LineNr = { fg = c.fg_dim },
		CursorLineNr = { fg = c.accent, bold = true },
		SignColumn = { bg = c.bg },
		StatusLine = { fg = c.fg, bg = c.bg_dark },
		StatusLineNC = { fg = c.fg_dim, bg = c.bg_dark },
		VertSplit = { fg = c.bg_dark },
		ColorColumn = { bg = c.bg_dark },

		-- Syntax
		Comment = { fg = c.fg_dim, italic = true },
		String = { fg = c.green },
		Function = { fg = c.blue, bold = true },
		Keyword = { fg = c.magenta, italic = true },
		Statement = { fg = c.magenta },
		Type = { fg = c.cyan },
		Constant = { fg = c.yellow },
		Identifier = { fg = c.fg },
		Operator = { fg = c.cyan },
		PreProc = { fg = c.accent },
		Special = { fg = c.accent },

		-- Builtin LSP / Diagnostics / ALE / CoC
		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.yellow },
		DiagnosticInfo = { fg = c.blue },
		DiagnosticHint = { fg = c.cyan },
		DiagnosticUnderlineError = { undercurl = true, sp = c.red },
		ALEErrorSign = { fg = c.red },
		ALEWarningSign = { fg = c.yellow },
		CocErrorSign = { fg = c.red },
		CocWarningSign = { fg = c.yellow },

		-- Treesitter / Context
		["@variable"] = { fg = c.fg },
		["@function"] = { fg = c.blue },
		["@keyword"] = { fg = c.magenta, italic = true },
		["@property"] = { fg = c.cyan },
		["@string"] = { fg = c.green },
		["@comment"] = { fg = c.fg_dim, italic = true },
		["@type"] = { fg = c.cyan },
		["@constant"] = { fg = c.yellow },
		["@operator"] = { fg = c.cyan },
		["@preproc"] = { fg = c.accent },
		["@special"] = { fg = c.accent },
		["@function.call"] = { fg = c.blue },
		["@method.call"] = { fg = c.blue },
		["@namespace"] = { fg = c.accent },
		["@parameter"] = { fg = c.fg },
		["@field"] = { fg = c.cyan },
		["@type.definition"] = { fg = c.cyan, bold = true },
		["@type.builtin"] = { fg = c.cyan, bold = true },
		["@label"] = { fg = c.yellow },
		["@tag"] = { fg = c.magenta },
		["@tag.attribute"] = { fg = c.yellow },
		["@text.uri"] = { fg = c.blue, underline = true },
		["@text.reference"] = { fg = c.blue, underline = true },
		["@text.title"] = { fg = c.magenta, bold = true },
		["@text.emphasis"] = { italic = true },
		["@text.strong"] = { bold = true },
		["@text.literal"] = { fg = c.green },
		["@text.todo"] = { fg = c.accent, bold = true },
		["@comment.documentation"] = { fg = c.fg_dim, italic = true },
		["@constructor"] = { fg = c.blue, bold = true },
		["@enum"] = { fg = c.cyan },
		["@enumMember"] = { fg = c.yellow },
		["@interface"] = { fg = c.cyan, bold = true },
		["@struct"] = { fg = c.cyan, bold = true },
		["@typeParameter"] = { fg = c.cyan },
		["@variable.builtin"] = { fg = c.accent },
		TreesitterContext = { bg = c.bg_highlight },

		-- Telescope / FZF-Lua
		TelescopeBorder = { fg = c.bg_highlight, bg = c.bg },
		TelescopePromptBorder = { fg = c.accent, bg = c.bg },
		TelescopeSelection = { bg = c.bg_highlight },
		FzfLuaBorder = { fg = c.bg_highlight },

		-- Git (Signs, Gutter, Neogit, Diffview)
		GitSignsAdd = { fg = c.green },
		GitSignsChange = { fg = c.yellow },
		GitSignsDelete = { fg = c.red },
		DiffAdd = { bg = "#2d3f34" }, -- Muted dark green
		DiffDelete = { bg = "#3f2d2d" }, -- Muted dark red
		DiffviewFile = { fg = c.fg },

		-- File Trees (NvimTree, NeoTree)
		NvimTreeNormal = { bg = c.bg_dark },
		NvimTreeFolderIcon = { fg = c.blue },
		NeoTreeNormal = { bg = c.bg_dark },
		NeoTreeDirectoryIcon = { fg = c.blue },

		-- UI Plugins (Cmp, Bufferline, WhichKey, Notify, IndentBlankline)
		CmpItemAbbrMatch = { fg = c.accent, bold = true },
		CmpItemKind = { fg = c.blue },
		BufferLineFill = { bg = c.bg_dark },
		BufferLineBackground = { bg = c.bg_dark },
		WhichKey = { fg = c.accent },
		NotifyBackground = { bg = c.bg },
		IblIndent = { fg = c.bg_highlight },

		-- DAP / Fidget / Dashboard
		DapUIScope = { fg = c.cyan },
		DapUIType = { fg = c.magenta },
		FidgetTitle = { fg = c.accent, bold = true },
		DashboardHeader = { fg = c.magenta },

		-- Snacks
		SnacksIndent = { fg = c.bg_highlight },
		SnacksIndentBlank = { fg = c.bg_highlight },
		SnacksIndentScope = { fg = c.cyan },
		SnacksIndentChunk = { fg = c.accent },
		SnacksIndent1 = { fg = c.green },
		SnacksIndent2 = { fg = c.yellow },
		SnacksIndent3 = { fg = c.blue },
		SnacksIndent4 = { fg = c.magenta },
		SnacksIndent5 = { fg = c.red },
		SnacksIndent6 = { fg = c.cyan },
		SnacksIndent7 = { fg = c.accent },
		SnacksIndent8 = { fg = c.green },
		SnacksBackdrop = { bg = c.bg_dark },

		AvanteButtonDanger = { fg = c.bg, bg = c.red },
		AvanteButtonPrimaryHover = { fg = c.bg, bg = c.cyan },
		AvanteButtonPrimary = { fg = c.bg, bg = c.fg_dim },
		AvanteButtonDefaultHover = { fg = c.bg, bg = c.green },
		AvanteToBeDeleted = { strikethrough = true, sp = c.red, bg = "#ffcccc" },
		AvanteButtonDefault = { fg = c.bg, bg = c.fg_dim },
		AvanteInlineHint = { link = "Keyword" },
		AvantePopupHint = { link = "NormalFloat" },
		AvanteSidebarWinSeparator = { fg = c.bg_dark, bg = c.bg_dark },
		AvanteSuggestion = { link = "Comment" },
		AvanteSidebarNormal = { link = "NormalFloat" },
		AvanteSidebarWinHorizontalSeparator = { fg = c.fg, bg = c.bg_dark },
		AvanteThinking = { fg = c.magenta, bg = c.bg_dark },
		AvanteTaskCompleted = { fg = c.green, bg = c.bg_dark },
		AvanteStateSpinnerCompacting = { fg = c.bg, bg = c.magenta },
		AvanteStateSpinnerSearching = { fg = c.bg, bg = c.magenta },
		AvanteStateSpinnerSucceeded = { fg = c.bg, bg = c.green },
		AvanteStateSpinnerFailed = { fg = c.bg, bg = c.red },
		AvanteStateSpinnerToolCalling = { fg = c.bg, bg = c.cyan },
		AvanteStateSpinnerGenerating = { fg = c.bg, bg = c.accent },
		AvanteReversedNormal = { fg = c.bg, bg = c.fg },
		AvanteCommentFg = { fg = c.fg_dim },
		AvanteAnnotation = { link = "Comment" },
		AvanteToBeDeletedWOStrikethrough = { bg = "#562c30" },
		AvanteConfirmTitle = { fg = c.bg, bg = c.red },
		AvantePromptInputBorder = { link = "NormalFloat" },
		AvantePromptInput = {},
		AvanteButtonDangerHover = { fg = c.bg, bg = c.red },
		AvanteStateSpinnerThinking = { fg = c.bg, bg = c.magenta },
		AvanteConflictIncomingLabel = { bg = "#3f5c6b", fg = c.fg },
		AvanteConflictCurrentLabel = { bg = "#3f5c6b", fg = c.fg },
		AvanteConflictIncoming = { bg = "#2d3f47", fg = c.fg },
		AvanteConflictCurrent = { bg = "#2d3f47", fg = c.fg },

		WinBar = { fg = c.fg_dim, bg = c.bg },
		WinBarNC = { fg = c.fg_dim, bg = c.bg },

		Folded = { fg = c.fg_dim, bg = c.bg_dark },

		-- Misc (Mini, FSRead, Circles)
		MiniStatuslineModeNormal = { bg = c.accent, fg = c.bg },
		CircleInfo = { fg = c.blue },
	}

	for group, settings in pairs(groups) do
		set_hl(group, settings)
	end
end

return M
