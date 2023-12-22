-- sql_builder.lua

local SQLBuilder = {}

function SQLBuilder.new(id)
    local self = setmetatable({}, { __index = SQLBuilder })
    self:reset()
    if id then
        print("setting id ", id)
        self.id = id
    end
    return self
end

function SQLBuilder:parse(...)
    local args = { ... }

    local columns = "*"
    local limit = 10
    local id = nil

    for i, v in ipairs(args) do
        if args[i] == "-c" then
            columns = args[i + 1]
        end
        if args[i] == "-l" then
            limit = args[i + 1]
        end
    end
    local b = self:setColumns(columns):setLimit(limit)

    if id then
        b = b.setID(id)
    end

    self.query = b:build()
    return self
end

function SQLBuilder:reset()
    self.table_name = ""
    self.columns = ""
    self.limit = 10
    self.query = ""
end

function SQLBuilder:setTable(table_name)
    self.table_name = table_name
    return self
end

function SQLBuilder:setColumns(columns)
    self.columns = columns
    return self
end

function SQLBuilder:setLimit(limit)
    self.limit = limit
    return self
end

function SQLBuilder:setID(id)
    if id then
        self.id = id
    end
    return self
end

function SQLBuilder:build()
    local sql_query = "SELECT "

    if self.columns then
        sql_query = sql_query .. self.columns
    else
        sql_query = sql_query .. "*"
    end

    sql_query = sql_query .. " FROM " .. self.table_name

    if self.id then
        sql_query = sql_query .. " WHERE ID=" .. self.id
    end

    if self.limit then
        sql_query = sql_query .. " LIMIT " .. self.limit
    end

    return sql_query
end

return SQLBuilder
