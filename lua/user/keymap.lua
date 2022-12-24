-- Simple function to ease setting the keybindings in './keybindings.lua'
-- NEVER MODIFY

local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
        outer_opts,
        opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {nmap = false})
M.nnmap = bind("n")
M.vnmap = bind("v")
M.xnmap = bind("x")
M.inmap = bind("i")
M.tnmap = bind("t")

return M
