-- Treesitter highlight groups for xghost.nvim
local M = {}

function M.get(c, config)
	local hl = {}

	-- Helper to determine bold based on font_style
	local function use_bold_for(element_type)
		if config.font_style == "bold" then
			return true
		elseif config.font_style == "semi_bold" then
			return element_type == "ui" or element_type == "emphasis"
		elseif config.font_style == "regular" then
			return element_type == "emphasis"
		end
		return true
	end

	-- Treesitter syntax groups
	-- Reference: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md

	-- Comments
	hl["@comment"] = { fg = c.comment, italic = config.italic_comments }
	hl["@comment.documentation"] = { fg = c.subtle, italic = config.italic_comments }
	hl["@comment.error"] = { fg = c.error }
	hl["@comment.warning"] = { fg = c.warning }
	hl["@comment.todo"] = { fg = c.bg, bg = c.yellow, bold = use_bold_for("emphasis") }
	hl["@comment.note"] = { fg = c.bg, bg = c.blue, bold = use_bold_for("emphasis") }

	-- Constants
	hl["@constant"] = { fg = c.orange_muted }
	hl["@constant.builtin"] = { fg = c.orange_muted }
	hl["@constant.macro"] = { fg = c.orange_muted }

	-- Numbers and booleans
	hl["@number"] = { fg = c.orange_muted }
	hl["@number.float"] = { fg = c.orange_muted }
	hl["@boolean"] = { fg = c.orange_muted }

	-- Strings
	hl["@string"] = { fg = c.green_muted }
	hl["@string.documentation"] = { fg = c.green_muted, italic = true }
	hl["@string.regexp"] = { fg = c.cyan_muted }
	hl["@string.escape"] = { fg = c.cyan_muted }
	hl["@string.special"] = { fg = c.cyan_muted }
	hl["@string.special.symbol"] = { fg = c.cyan_muted }
	hl["@string.special.url"] = { fg = c.cyan, underline = true }
	hl["@string.special.path"] = { fg = c.green_muted }

	hl["@character"] = { fg = c.green_muted }
	hl["@character.special"] = { fg = c.cyan_muted }

	-- Functions
	hl["@function"] = { fg = c.blue_muted }
	hl["@function.builtin"] = { fg = c.blue_muted }
	hl["@function.call"] = { fg = c.blue_muted }
	hl["@function.macro"] = { fg = c.blue_muted }
	hl["@function.method"] = { fg = c.blue_muted }
	hl["@function.method.call"] = { fg = c.blue_muted }

	hl["@constructor"] = { fg = c.yellow_muted }
	hl["@operator"] = { fg = c.fg_dark }

	-- Keywords
	hl["@keyword"] = { fg = c.magenta_muted, italic = config.italic_keywords }
	hl["@keyword.function"] = { fg = c.magenta_muted, italic = config.italic_keywords }
	hl["@keyword.operator"] = { fg = c.magenta_muted, bold = config.bold_keywords }
	hl["@keyword.return"] = { fg = c.magenta_muted, bold = config.bold_keywords }
	hl["@keyword.import"] = { fg = c.magenta_muted }
	hl["@keyword.export"] = { fg = c.magenta_muted }
	hl["@keyword.conditional"] = { fg = c.magenta_muted, bold = config.bold_keywords }
	hl["@keyword.repeat"] = { fg = c.magenta_muted, bold = config.bold_keywords }
	hl["@keyword.exception"] = { fg = c.red_muted }

	hl["@conditional"] = { fg = c.magenta_muted, bold = config.bold_keywords }
	hl["@repeat"] = { fg = c.magenta_muted, bold = config.bold_keywords }
	hl["@exception"] = { fg = c.red_muted }

	-- Variables
	hl["@variable"] = { fg = c.fg }
	hl["@variable.builtin"] = { fg = c.orange_muted }
	hl["@variable.parameter"] = { fg = c.fg }
	hl["@variable.member"] = { fg = c.fg }

	-- Types
	hl["@type"] = { fg = c.yellow_muted }
	hl["@type.builtin"] = { fg = c.yellow_muted }
	hl["@type.definition"] = { fg = c.yellow_muted }
	hl["@type.qualifier"] = { fg = c.magenta_muted }

	hl["@property"] = { fg = c.fg }
	hl["@attribute"] = { fg = c.blue_muted }
	hl["@attribute.builtin"] = { fg = c.blue_muted }

	-- Identifiers
	hl["@module"] = { fg = c.fg }
	hl["@label"] = { fg = c.blue_muted }

	-- Punctuation
	hl["@punctuation.delimiter"] = { fg = c.fg_dark }
	hl["@punctuation.bracket"] = { fg = c.fg_dark }
	hl["@punctuation.special"] = { fg = c.fg_dark }

	-- Tags (HTML, XML, etc.)
	hl["@tag"] = { fg = c.blue_muted }
	hl["@tag.builtin"] = { fg = c.blue_muted }
	hl["@tag.attribute"] = { fg = c.yellow_muted }
	hl["@tag.delimiter"] = { fg = c.fg_dark }

	-- Markup (Markdown, etc.)
	hl["@markup.strong"] = { bold = true }
	hl["@markup.italic"] = { italic = true }
	hl["@markup.strikethrough"] = { strikethrough = true }
	hl["@markup.underline"] = { underline = true }

	hl["@markup.heading"] = { fg = c.blue, bold = true }
	hl["@markup.heading.1"] = { fg = c.blue, bold = true }
	hl["@markup.heading.2"] = { fg = c.cyan, bold = true }
	hl["@markup.heading.3"] = { fg = c.green, bold = true }
	hl["@markup.heading.4"] = { fg = c.yellow, bold = true }
	hl["@markup.heading.5"] = { fg = c.orange, bold = true }
	hl["@markup.heading.6"] = { fg = c.magenta, bold = true }

	hl["@markup.quote"] = { fg = c.subtle, italic = true }
	hl["@markup.math"] = { fg = c.orange_muted }

	hl["@markup.link"] = { fg = c.cyan_muted }
	hl["@markup.link.label"] = { fg = c.blue, underline = true }
	hl["@markup.link.url"] = { fg = c.blue, underline = true }

	hl["@markup.raw"] = { fg = c.cyan_muted }
	hl["@markup.raw.block"] = { fg = c.fg_dark }

	hl["@markup.list"] = { fg = c.blue_muted }
	hl["@markup.list.checked"] = { fg = c.green }
	hl["@markup.list.unchecked"] = { fg = c.fg_dark }

	-- Diff
	hl["@diff.plus"] = { fg = c.git_add }
	hl["@diff.minus"] = { fg = c.git_delete }
	hl["@diff.delta"] = { fg = c.git_change }

	-- Special
	hl["@none"] = { fg = c.fg }
	hl["@conceal"] = { fg = c.subtle }

	-- Semantic tokens
	hl["@lsp.type.class"] = { link = "@type" }
	hl["@lsp.type.decorator"] = { link = "@attribute" }
	hl["@lsp.type.enum"] = { link = "@type" }
	hl["@lsp.type.enumMember"] = { link = "@constant" }
	hl["@lsp.type.function"] = { link = "@function" }
	hl["@lsp.type.interface"] = { link = "@type" }
	hl["@lsp.type.macro"] = { link = "@constant.macro" }
	hl["@lsp.type.method"] = { link = "@function.method" }
	hl["@lsp.type.namespace"] = { link = "@module" }
	hl["@lsp.type.parameter"] = { link = "@variable.parameter" }
	hl["@lsp.type.property"] = { link = "@property" }
	hl["@lsp.type.struct"] = { link = "@type" }
	hl["@lsp.type.type"] = { link = "@type" }
	hl["@lsp.type.typeParameter"] = { link = "@type.definition" }
	hl["@lsp.type.variable"] = { link = "@variable" }

	return hl
end

return M
