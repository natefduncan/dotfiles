local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<Bar>"] = { "<cmd> vsplit new <CR>", "new vertial window" },
    ["_"] = { "<cmd> split new <CR>", "new horizontal window" },
  },
}

-- more keybinds!

return M
