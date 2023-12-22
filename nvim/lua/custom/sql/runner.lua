-- Define the function to run your static command and open JSON buffer
function RunSQL2JSON(sql_query)
    -- Generate a temporary filename with a .json extension
    local temp_filename = vim.fn.tempname() .. ".json"

    -- Add a comment with the SQL query at the top of the JSON file
    local comment = string.format('// %s', sql_query)

    -- Run the shell command and save the result to the temporary file
    local command = string.format('mycli playground -e "%s" -t | dasel -r csv -w json > %s', sql_query, temp_filename)
    os.execute(command)

    -- Read the content of the temporary file
    local result = vim.fn.readfile(temp_filename)

    -- Insert the comment at the beginning of the file
    table.insert(result, 1, comment)

    -- Write the modified content back to the file
    vim.fn.writefile(result, temp_filename)
    -- Set a name for the tab
    local tab_name = "MyJsonTab"
    vim.api.nvim_command('tabnew ' .. tab_name)

    -- Open the file directly
    vim.api.nvim_command('edit ' .. temp_filename)
end

return RunSQL2JSON
