-- Test suite for xghost.nvim theme
-- Verifies that highlight groups are properly defined and match expected styling

local M = {}

-- Helper function to check if a highlight group is defined
local function check_hl_group(group_name, expected_attrs)
	local hl = vim.api.nvim_get_hl(0, { name = group_name })

	if not hl or vim.tbl_isempty(hl) then
		return false, string.format("Highlight group '%s' is not defined", group_name)
	end

	-- Check expected attributes if provided
	if expected_attrs then
		for attr, expected_value in pairs(expected_attrs) do
			if hl[attr] ~= expected_value then
				return false, string.format(
					"Highlight group '%s' attr '%s' = %s, expected %s",
					group_name, attr, tostring(hl[attr]), tostring(expected_value)
				)
			end
		end
	end

	return true, nil
end

-- Test that core highlight groups exist
function M.test_core_highlights()
	local core_groups = {
		"Normal",
		"Comment",
		"Constant",
		"String",
		"Function",
		"Keyword",
		"Type",
		"Error",
		"WarningMsg",
	}

	local errors = {}
	for _, group in ipairs(core_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Core highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All core highlights defined"
end

-- Test bufferline highlights
function M.test_bufferline_highlights()
	local bufferline_groups = {
		"BufferLineFill",
		"BufferLineBufferSelected",
		"BufferLineBufferVisible",
		"BufferLineIndicatorSelected",
	}

	local errors = {}
	for _, group in ipairs(bufferline_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Bufferline highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All bufferline highlights defined"
end

-- Test lualine highlights
function M.test_lualine_highlights()
	local lualine_groups = {
		"LualineNormalMode",
		"LualineSectionA",
		"LualineSectionB",
		"LualineSectionC",
		"LualineGitBranch",
	}

	local errors = {}
	for _, group in ipairs(lualine_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Lualine highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All lualine highlights defined"
end

-- Test snacks highlights
function M.test_snacks_highlights()
	local snacks_groups = {
		"SnacksExplorerNormal",
		"SnacksExplorerDir",
		"SnacksExplorerFile",
		"SnacksExplorerGitAdd",
		"SnacksExplorerGitChange",
	}

	local errors = {}
	for _, group in ipairs(snacks_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Snacks highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All snacks highlights defined"
end

-- Test oil highlights
function M.test_oil_highlights()
	local oil_groups = {
		"OilDir",
		"OilFile",
		"OilExecutable",
		"OilNormal",
	}

	local errors = {}
	for _, group in ipairs(oil_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Oil highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All oil highlights defined"
end

-- Test git highlights
function M.test_git_highlights()
	local git_groups = {
		"GitSignsAdd",
		"GitSignsChange",
		"GitSignsDelete",
	}

	local errors = {}
	for _, group in ipairs(git_groups) do
		local ok, err = check_hl_group(group)
		if not ok then
			table.insert(errors, err)
		end
	end

	if #errors > 0 then
		return false, "Git highlights missing:\n" .. table.concat(errors, "\n")
	end

	return true, "All git highlights defined"
end

-- Run all tests
function M.run_all_tests()
	print("Running xghost.nvim theme tests...\n")

	-- Load the theme first
	require("xghost").setup()
	require("xghost").load()

	local tests = {
		{ name = "Core Highlights", func = M.test_core_highlights },
		{ name = "Bufferline Highlights", func = M.test_bufferline_highlights },
		{ name = "Lualine Highlights", func = M.test_lualine_highlights },
		{ name = "Snacks Highlights", func = M.test_snacks_highlights },
		{ name = "Oil Highlights", func = M.test_oil_highlights },
		{ name = "Git Highlights", func = M.test_git_highlights },
	}

	local passed = 0
	local failed = 0

	for _, test in ipairs(tests) do
		local ok, result = test.func()
		if ok then
			print(string.format("✓ %s: %s", test.name, result))
			passed = passed + 1
		else
			print(string.format("✗ %s: %s", test.name, result))
			failed = failed + 1
		end
	end

	print(string.format("\nTests: %d passed, %d failed, %d total", passed, failed, passed + failed))

	return failed == 0
end

return M
