-- Christmas Neovim Theme

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
	vim.cmd('syntax reset')
end

vim.o.background = 'dark'
vim.g.colors_name = 'christmas'

local colors = {
	-- Background colors
	bg = 'NONE', -- Dark night sky
	bg_light = 'NONE', -- Slightly lighter background for UI elements

	-- Foreground colors
	fg = '#e0e6ed', -- Light text
	fg_muted = '#8b95a5', -- Muted/comment text

	-- Christmas palette
	red = '#ff2e31', -- Bright red
	red_dark = '#c41c1e', -- Dark red for accents
	red_light = '#ff5558', -- Light red

	green = '#2d9f3e', -- Christmas green
	green_dark = '#1a5c28', -- Dark green
	green_light = '#3fbd52', -- Light green

	gold = '#f4a460', -- Gold/orange accent
	gold_dark = '#d17a2f', -- Dark gold
	gold_light = '#ffb84d', -- Light gold

	-- Functional colors
	white = '#ffffff', -- Pure white
	black = '#000000', -- Pure black
	snow = '#f0f4f8', -- Snow white

	-- UI colors
	border = '#2a4a6a', -- Border color
	cursor_line = '#1a3a4a', -- Cursor line background
	visual = '#2a5a7a', -- Visual selection

	-- Status/diagnostic colors
	error = '#ff5555', -- Error
	warning = '#ffb84d', -- Warning/gold
	info = '#5ea6ff', -- Info
	hint = '#7fbfff', -- Hint
}

local function hl(group, opts)
	local hl_string = 'hi ' .. group
	if opts.fg then
		hl_string = hl_string .. ' guifg=' .. opts.fg
	end
	if opts.bg then
		hl_string = hl_string .. ' guibg=' .. opts.bg
	end
	if opts.bold then
		hl_string = hl_string .. ' gui=bold'
	end
	if opts.italic then
		hl_string = hl_string .. ' gui=italic'
	end
	if opts.underline then
		hl_string = hl_string .. ' gui=underline'
	end
	if opts.link then
		hl_string = 'hi! link ' .. group .. ' ' .. opts.link
	end
	vim.cmd(hl_string)
end

-- Editor UI highlights
hl('Normal', { fg = colors.fg, bg = colors.bg })
hl('NormalNC', { fg = colors.fg, bg = colors.bg })
hl('NormalFloat', { fg = colors.fg, bg = colors.bg_light })
hl('FloatBorder', { fg = colors.border, bg = colors.bg_light })

hl('CursorLine', { bg = colors.cursor_line })
hl('CursorColumn', { bg = colors.cursor_line })
hl('Visual', { bg = colors.visual })
hl('VisualNOS', { bg = colors.visual })

hl('LineNr', { fg = colors.fg_muted })
hl('CursorLineNr', { fg = colors.gold, bold = true })

hl('SignColumn', { bg = colors.bg })
hl('Folded', { fg = colors.fg_muted, bg = colors.bg_light })
hl('FoldColumn', { fg = colors.fg_muted, bg = colors.bg })

hl('Search', { fg = colors.black, bg = colors.gold })
hl('IncSearch', { fg = colors.black, bg = colors.gold_light })
hl('Substitute', { fg = colors.black, bg = colors.red_light })

-- Syntax highlighting
hl('Comment', { fg = colors.fg_muted, italic = true })

hl('String', { fg = colors.green_light })
hl('Character', { fg = colors.green_light })

hl('Number', { fg = colors.gold_light })
hl('Boolean', { fg = colors.red_light })
hl('Float', { fg = colors.gold_light })

hl('Keyword', { fg = colors.red, bold = true })
hl('Statement', { fg = colors.red })
hl('Conditional', { fg = colors.red })
hl('Repeat', { fg = colors.red })
hl('Label', { fg = colors.red })
hl('Operator', { fg = colors.snow })

hl('Function', { fg = colors.gold })
hl('Identifier', { fg = colors.snow })
hl('Variable', { fg = colors.snow })

hl('Type', { fg = colors.green })
hl('StorageClass', { fg = colors.red })
hl('Structure', { fg = colors.green })
hl('Typedef', { fg = colors.green })

hl('Special', { fg = colors.gold })
hl('SpecialChar', { fg = colors.gold })
hl('Tag', { fg = colors.red })
hl('Delimiter', { fg = colors.snow })

hl('Error', { fg = colors.error, bold = true })
hl('Todo', { fg = colors.gold, bold = true })

-- Diagnostic/LSP colors
hl('DiagnosticError', { fg = colors.error })
hl('DiagnosticWarn', { fg = colors.warning })
hl('DiagnosticInfo', { fg = colors.info })
hl('DiagnosticHint', { fg = colors.hint })

hl('DiagnosticUnderlineError', { underline = true })
hl('DiagnosticUnderlineWarn', { underline = true })
hl('DiagnosticUnderlineInfo', { underline = true })
hl('DiagnosticUnderlineHint', { underline = true })

hl('DiagnosticVirtualTextError', { fg = colors.error })
hl('DiagnosticVirtualTextWarn', { fg = colors.warning })
hl('DiagnosticVirtualTextInfo', { fg = colors.info })
hl('DiagnosticVirtualTextHint', { fg = colors.hint })

-- Treesitter highlights
hl('@keyword', { fg = colors.red, bold = true })
hl('@keyword.return', { fg = colors.red })
hl('@conditional', { fg = colors.red })
hl('@repeat', { fg = colors.red })

hl('@string', { fg = colors.green_light })
hl('@string.escape', { fg = colors.gold })
hl('@string.regex', { fg = colors.gold })

hl('@number', { fg = colors.gold_light })
hl('@float', { fg = colors.gold_light })
hl('@boolean', { fg = colors.red_light })

hl('@function', { fg = colors.gold })
hl('@function.call', { fg = colors.gold })
hl('@method', { fg = colors.gold })
hl('@method.call', { fg = colors.gold })

hl('@variable', { fg = colors.snow })
hl('@variable.parameter', { fg = colors.snow })
hl('@field', { fg = colors.snow })
hl('@property', { fg = colors.snow })

hl('@type', { fg = colors.green })
hl('@type.builtin', { fg = colors.green })

hl('@comment', { fg = colors.fg_muted, italic = true })
hl('@comment.documentation', { fg = colors.fg_muted, italic = true })

hl('@operator', { fg = colors.snow })
hl('@punctuation', { fg = colors.snow })
hl('@punctuation.bracket', { fg = colors.snow })
hl('@punctuation.delimiter', { fg = colors.snow })

hl('@tag', { fg = colors.red })
hl('@tag.attribute', { fg = colors.gold })

hl('@namespace', { fg = colors.green })

-- UI elements
hl('Pmenu', { fg = colors.fg, bg = colors.bg_light })
hl('PmenuSel', { fg = colors.bg, bg = colors.gold })
hl('PmenuThumb', { bg = colors.gold })
hl('PmenuSbar', { bg = colors.bg_light })

hl('StatusLine', { fg = colors.snow, bg = colors.bg_light })
hl('StatusLineNC', { fg = colors.fg_muted, bg = colors.bg_light })
hl('VertSplit', { fg = colors.border })

hl('Tabline', { fg = colors.fg_muted, bg = colors.bg_light })
hl('TablineSel', { fg = colors.gold, bg = colors.bg })
hl('TablineFill', { bg = colors.bg_light })

hl('WildMenu', { fg = colors.bg, bg = colors.gold })
hl('Question', { fg = colors.gold })
hl('MoreMsg', { fg = colors.green_light })
hl('WarningMsg', { fg = colors.warning })
hl('ErrorMsg', { fg = colors.error })

-- Command line
hl('MsgArea', { fg = colors.fg, bg = colors.bg })
hl('MsgSeparator', { fg = colors.border, bg = colors.bg })

-- Diff
hl('DiffAdd', { fg = colors.green, bg = colors.green_dark })
hl('DiffDelete', { fg = colors.red, bg = colors.red_dark })
hl('DiffChange', { fg = colors.gold, bg = colors.gold_dark })
hl('DiffText', { fg = colors.black, bg = colors.gold })

-- Spelling
hl('SpellBad', { underline = true, fg = colors.error })
hl('SpellCap', { underline = true, fg = colors.warning })
hl('SpellRare', { underline = true, fg = colors.info })
hl('SpellLocal', { underline = true, fg = colors.hint })

-- Misc
hl('NonText', { fg = colors.fg_muted })
hl('Whitespace', { fg = colors.fg_muted })
hl('Title', { fg = colors.green, bold = true })
hl('Underlined', { underline = true })

return true
