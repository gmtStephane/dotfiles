if vim.g.vscode then
    require("code.config.mappings")
    require("code.config.lazy")
else
    -- ordinary Neovim
end

