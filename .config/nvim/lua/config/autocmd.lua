local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd("FileType", {
  group = augroup("fix_terraform_comment_string"),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "# %s"
  end,
  pattern = { "terraform", "hcl" },
})

autocmd("LspAttach", {
  group = augroup("lsp_keybinds"),
  callback = function(ev)
    local nmap = function(key, handler, desc)
      vim.keymap.set("n", key, handler, {
        buffer = ev.buf,
        desc = desc,
      })
    end

    nmap("K", vim.lsp.buf.hover, "Hover Documentation")

    nmap("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    nmap("<leader>ca", vim.lsp.buf.code_action, "Perform code action")

    nmap("gd", vim.lsp.buf.definition, "Goto definition")
    nmap("gD", vim.lsp.buf.declaration, "Goto declaration")
    nmap("gi", vim.lsp.buf.implementation, "Goto implementation")
    nmap("td", vim.lsp.buf.type_definition, "Goto type definition")
  end,
})

autocmd("BufWritePre", {
  callback = function(ev)
    vim.lsp.buf.format({ bufnr = ev.bufnr })
  end
})
