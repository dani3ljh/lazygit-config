-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move Selection Up"})
map("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move Selection Down"})

map("n", "<C-d>", "<C-d>zz", {desc = "Page Down"})
map("n", "<C-u>", "<C-u>zz", {desc = "Page Up"})

map("i", "<C-H>", "<C-W>", {desc = "Delete Word"})
map("i", "<C-c>", "<Esc>")

map("n", "Q", "nop")

map("n", "<leader>y", "\"+y", {desc = "Copy to Clipboard"})
map("v", "<leader>y", "\"+y", {desc = "Copy to Clipboard"})

map("n", "<leader>p", "\"+p", {desc = "Paste from Clipboard"})
map("v", "<leader>p", "\"+p", {desc = "Paste from Clipboard"})
