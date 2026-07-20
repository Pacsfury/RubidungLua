local buttons = {}

function love.load()
    love.graphics.setBackgroundColor(0.1, 0.12, 0.15)

    love.graphics.setNewFont(24)

    buttons = {
        {x = 200, y = 200, w = 400, h = 60, text = "Local Mode", action = "local.lua", isHovered = false},
        {x = 200, y = 280, w = 400, h = 60, text = "Multiplayer", action = "multiplayer.lua", isHovered = false},
        {x = 200, y = 360, w = 400, h = 60, text = "Open Server", action = "serverinit.lua", isHovered = false}
    }
end

function love.update(dt)
    local mx, my = love.mouse.getPosition()

    for _, btn in ipairs(buttons) do
        if mx >= btn.x and mx <= btn.x + btn.w and my >= btn.y and my <= btn.y + btn.h then
            btn.isHovered = true
        else
            btn.isHovered = false
        end
    end
end

function love.draw()
    for _, btn in ipairs(buttons) do
        if btn.isHovered then
            love.graphics.setColor(0.3, 0.5, 0.8)
        else
            love.graphics.setColor(0.2, 0.22, 0.25)
        end

        love.graphics.rectangle("fill", btn.x, btn.y, btn.w, btn.h, 10, 10)

        love.graphics.setColor(0.5, 0.7, 1.0)
        love.graphics.rectangle("line", btn.x, btn.y, btn.w, btn.h, 10, 10)

        love.graphics.setColor(1, 1, 1)
        local font = love.graphics.getFont()
        local textWidth = font:getWidth(btn.text)
        local textHeight = font:getHeight()

        local textX = btn.x + (btn.w / 2) - (textWidth / 2)
        local textY = btn.y + (btn.h / 2) - (textHeight / 2)
        love.graphics.print(btn.text, textX, textY)
    end

    love.graphics.setColor(1, 1, 1)
end

function love.mousepressed(mx, my, mbutton)
    if mbutton == 1 then
        for _, btn in ipairs(buttons) do
            if btn.isHovered then
                dofile(btn.action)

                if love.load then
                    love.load()
                end

                break
            end
        end
    end
end
