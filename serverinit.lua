local nl = require("NetworkLib")
local socket = require("socket")

local server_ready = false
local connection_attempts = 0
local max_attempts = 50

function love.load()
    os.execute('start "" network.exe')
    socket.sleep(1.0)
end

function love.update(dt)
    if not server_ready and connection_attempts < max_attempts then
        local success, msg = nl:init("127.0.0.1", 8080)
        
        if success then
            server_ready = true
            dofile("multiplayer.lua")
            if love.load then love.load() end
        else
            connection_attempts = connection_attempts + 1
            socket.sleep(0.2)
        end
    end
end

function love.draw()
    if not server_ready then
        love.graphics.setColor(1, 1, 1)
        love.graphics.print("Starting server... (attempt " .. connection_attempts .. "/" .. max_attempts .. ")", 50, 50)
    end
end