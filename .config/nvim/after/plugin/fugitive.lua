vim.keymap.set("n", "<leader>s", function() vim.cmd("Git ++curwin") end)

-- Open file under cursor in the status window's own buffer (replacing it)
-- instead of the default behavior which opens in a new split.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "fugitive",
  callback = function(event)
    vim.keymap.set("n", "<CR>", function()
      local file = vim.fn.expand("<cfile>")
      if file ~= "" then
        local root = vim.fn.FugitiveWorkTree()
        vim.cmd("edit " .. vim.fn.fnameescape(root .. "/" .. file))
      end
    end, { buffer = event.buf })
  end,
})
