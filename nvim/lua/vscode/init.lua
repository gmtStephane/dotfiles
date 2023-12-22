local function opentree(prefix)
    return function()
        print("hello")
        require('vscode-neovim').call('workbench.action.quickOpen', { args = { prefix } })
    end
end


function openFileInVscode()
    -- Escape special characters in the filepath
    filepath = "'https://stackoverflow.com/questions/48511956/toggle-between-fullscreen-editor-and-terminal-in-vs-code'"

    require('vscode-neovim').call('vscode.open', {
        args = {
            filepath
        }
    })
end

function hasTestFile()
    local current_file = vim.fn.expand('%:p')
    local test_file = current_file:gsub('%.go$', '_test.go')
    print(test_file)
    local exist = vim.fn.filereadable(test_file) == 1
    openFileInVscode(test_file)
end

vim.g.mapleader = " "
vim.keymap.set('n', '<Leader>o', opentree(''))
vim.keymap.set('n', '<Leader>ff', opentree(''))
vim.keymap.set('n', '<Leader>ft', opentree('integration/'))
vim.keymap.set('n', '<Leader>fd', opentree('deploy/'))
vim.keymap.set('n', '<Leader>fb', opentree('internal/business/'))
vim.keymap.set('n', '<Leader>fi', opentree('internal/implementation/'))
vim.keymap.set('n', '<Leader>fr', opentree('internal/implementation/repository/'))
vim.keymap.set('n', '<Leader>ft', opentree('internal/transport/'))

vim.keymap.set('n', '<Leader>tt', openFileInVscode)
