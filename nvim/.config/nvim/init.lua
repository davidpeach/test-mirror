require 'user.options'
require 'user.keymaps'
require 'user.plugins'
require 'user.lsp'


local colorscheme = "dracula"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end

require('lualine').setup({
    options = {
        theme = 'dracula-nvim'
    }
})
require("laravel").setup({
    split_cmd = "vertical",
    split_width = 120,
    bind_telescope = true,
    ask_for_args = true,
})

require("telescope").load_extension "laravel"
require 'colorizer'.setup()

-- MOVE MOVE
P = function (v)
    print(vim.inspect(v))
    return v
end

vim.keymap.set('n', '<leader><leader>x', ':w<cr> :source %<cr>')
