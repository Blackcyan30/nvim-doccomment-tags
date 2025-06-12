local M = {}

-- Default Doxygen/Javadoc tags
M.default_tags = {
	"@param",
	"@return",
	"@brief",
	"@file",
	"@author",
	"@version",
	"@see",
	"@since",
	"@details",
	"@throws",
	"@exception",
	"@deprecated",
	"@todo",
	"@note",
	"@warning",
	"@bug",
	"@example",
	"@test",
	"@def",
	"@typedef",
	"@var",
	"@struct",
	"@class",
	"@enum",
	"@interface",
	"@package",
	"@namespace",
	"@ingroup",
	"@addtogroup",
	"@fn",
	"@name",
	"@code",
	"@endcode",
	"@sa",
	"@ref",
	"@link",
	"@endlink",
	"@copydoc",
	"@docRoot",
	"@inheritDoc",
	"@internal",
	"@invariant",
	"@mainpage",
	"@page",
	"@section",
	"@subsection",
	"@test",
	"@threadsafe",
	"@nosubgrouping",
}

M.config = {
	tags = M.default_tags,
	hl_group = "Special", -- Default highlight group (should complement most colorschemes)
}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
	M._define_highlight()
	M._attach_autocmd()
end

function M._define_highlight()
	-- Only define if not already set by user/colorscheme
	if vim.fn.hlexists(M.config.hl_group) == 0 then
		vim.api.nvim_set_hl(0, M.config.hl_group, { link = "Special" })
	end
end

function M._attach_autocmd()
	vim.api.nvim_create_augroup("DocCommentTags", { clear = true })
	vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "InsertLeave", "BufWinEnter" }, {
		group = "DocCommentTags",
		callback = function()
			M.highlight_tags_in_comments()
		end,
	})
end

function M.highlight_tags_in_comments()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_clear_namespace(bufnr, M._ns or 0, 0, -1)
	M._ns = M._ns or vim.api.nvim_create_namespace("doccomment_tags")

	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local comment_pat = "^%s*[%/%*]+" -- crude: lines starting with //, /*, *
	local tag_pat = "@[%a_]+"

	for lnum, line in ipairs(lines) do
		if line:match(comment_pat) then
			for tag in line:gmatch(tag_pat) do
				if vim.tbl_contains(M.config.tags, tag) then
					local start_col, end_col = line:find(tag, 1, true)
					if start_col and end_col then
						vim.api.nvim_buf_add_highlight(
							bufnr,
							M._ns,
							M.config.hl_group,
							lnum - 1,
							start_col - 1,
							end_col
						)
					end
				end
			end
		end
	end
end

return M
