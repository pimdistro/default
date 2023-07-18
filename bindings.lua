-- Create a mapping for rename functionality
local rename_mapping = {
  '<cmd>lua require("renamer").rename()<cr>', -- Command to execute for renaming
  "rename",                                  -- Description for the mapping
  opts = {
    noremap = true,
    silent = true,
  },
}

-- Create mapping command for making comments
--
-- This function creates a mapping command for toggling comments in a code file.
-- It accepts an 'id' parameter indicating the type of comment to be toggled:
--   - "blockwise": Toggles comments in a block-wise manner.
--   - "linewise": Toggles comments in a line-wise manner.
--
-- Parameters:
--   - id (string): The type of comment to toggle. Must be either "blockwise" or "linewise".
--
-- Returns:
--   - command (string): The mapping command that can be used to toggle comments.
local comment = function(id)
  assert(id == "blockwise" or id == "linewise", "Invalid 'id' option. Must be either 'blockwise' or 'linewise'.")
  return '<cmd>lua require("Comment.api").toggle.' .. id .. ".current()<cr>"
end

return {
  n = {
    ["<F2>"] = rename_mapping,
    ["<leader>r"] = rename_mapping,
    ["<leader>/"] = { comment("linewise") },
    ["<leader>?"] = { comment("blockwise") },
    ["<leader>h"] = { "<cmd>15Term<cr>" },
    ["<F3>"] = { "<cmd>LspLinesToggle<cr>", "Toggle the fancy error lines" },
  },
  v = {
    ["<leader>r"] = rename_mapping,
  },
}
