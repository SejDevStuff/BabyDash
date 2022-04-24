Sky = {}

local skyTexture = love.graphics.newImage("assets/gfx/Sky.png")

function Sky:Draw()
    for y = 0, love.graphics:getHeight(), 36 do
        for x = 0, love.graphics:getWidth(), 36 do
            love.graphics.draw(skyTexture, love.graphics.newQuad(0, 0, 36, 36, 36, 36), x, y)
        end
    end
end