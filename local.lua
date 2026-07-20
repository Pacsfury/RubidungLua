local player_x = 0
local player_y = 0
local tileSize = 64
local GRID_SIZE = 64
local is_victorious = false

function love.load()

    default_x = 0
    default_y = 0
    local map = getMap(1)

    if map then
        for y, row in ipairs(map) do
            for x, character in ipairs(row) do
                if character == '@' then
                    default_x = x - 1
                    default_y = y - 1
                    break
                end
            end
        end
    end


    player_x = default_x
    player_y = default_y

end


function love.keypressed(key)
    if key == "w" or key == "up" then
        player_y = player_y - 1
    elseif key == "s" or key == "down" then
        player_y = player_y + 1
    elseif key == "a" or key == "left" then
        player_x = player_x - 1
    elseif key == "d" or key == "right" then
        player_x = player_x + 1
    end

    local tile = getTile(getMap(1), player_x, player_y)

    if tile == "#" then
        player_x = default_x
        player_y = default_y
    elseif tile == "$" then
        is_victorious = true
    end

end

function love.update(dt)
end

function love.draw()
    local map = getMap(1)
    
    drawMap(map)

    local status = "Playing Local"
    local status_color = {0.2, 0.8, 0.2}
    
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Net: ", 20, 20)
    love.graphics.setColor(status_color)
    love.graphics.print(status, 80, 20)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Synchronized position: (" .. player_x .. ", " .. player_y .. ")", 20, 50)

    if is_victorious then
        love.graphics.setColor(1, 0.3, 0.3)
        love.graphics.print("WON DETECTED", 20, 80)
    end

    if map then
        local mapWidth = #map[1] * tileSize
        local mapHeight = #map * tileSize
        local windowWidth = love.graphics.getWidth()
        local windowHeight = love.graphics.getHeight()

        local offsetX = (windowWidth - mapWidth) / 2
        local offsetY = (windowHeight - mapHeight) / 2

        local draw_x = offsetX + (player_x * GRID_SIZE)
        local draw_y = offsetY + (player_y * GRID_SIZE)

        love.graphics.setColor(0.2, 0.6, 1, 0.3)
        love.graphics.rectangle("fill", draw_x, draw_y, GRID_SIZE, GRID_SIZE, 6, 6)
        love.graphics.setColor(0.4, 0.8, 1)
        love.graphics.setLineWidth(2)
        love.graphics.rectangle("line", draw_x, draw_y, GRID_SIZE, GRID_SIZE, 6, 6)
        love.graphics.setLineWidth(1)
    end
end

function getMap(id)
    if id==1 then
        return {
            {'#', '#', '#', '#', '#'},
            {'#', '.', '.', '$', '#'},
            {'#', '#', '#', '.', '#'},
            {'#', '.', '.', '.', '#'},
            {'#', '@', '#', '#', '#'}
        }
    end
    return nil
end

function drawMap(map)
    if not map then return end

    local mapHeight = #map * tileSize
    local mapWidth = 0
    if #map > 0 then
        mapWidth = #map[1] * tileSize
    end

    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()

    local offsetX = (windowWidth - mapWidth) / 2
    local offsetY = (windowHeight - mapHeight) / 2

    local font = love.graphics.getFont()

    for y, row in ipairs(map) do
        for x, character in ipairs(row) do
            local cellX = offsetX + (x - 1) * tileSize
            local cellY = offsetY + (y - 1) * tileSize
            
            if character == '#' then
                love.graphics.setColor(0.25, 0.27, 0.3) 
            elseif character == '@' then
                love.graphics.setColor(0.2, 0.7, 0.3)
            elseif character == '$' then
                love.graphics.setColor(0.9, 0.7, 0.1)
            else
                love.graphics.setColor(0.15, 0.17, 0.2)
            end
            love.graphics.rectangle("fill", cellX + 2, cellY + 2, tileSize - 4, tileSize - 4, 4, 4)

            if character == '#' then
                love.graphics.setColor(0.5, 0.55, 0.6) 
            elseif character == '@' then
                love.graphics.setColor(1, 1, 1)
            elseif character == '$' then
                love.graphics.setColor(1, 0.9, 0.3)
            else
                love.graphics.setColor(0.4, 0.4, 0.45)
            end

            local textWidth = font:getWidth(character)
            local textHeight = font:getHeight()

            local textX = cellX + (tileSize - textWidth) / 2
            local textY = cellY + (tileSize - textHeight) / 2

            love.graphics.print(character, textX, textY)
        end
    end
    
    love.graphics.setColor(1, 1, 1)
end

function getTile(map, x, y)
    if not map then return "#" end
    
    if map[y+1] then
        return map[y+1][x+1]
    end
    
    return "#"
end