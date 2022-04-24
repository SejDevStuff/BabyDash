local gfile = require "globals"

Ground = {}

local grassMiddle = love.graphics.newImage("assets/gfx/GrassMiddle.png")
local y = love.graphics:getHeight() - 36

love.graphics.setDefaultFilter("nearest", "nearest")

local Blocks = {}
for i = 0, love.graphics:getWidth()+36, 36 do
    local NewGrass = {x = 0}
    NewGrass.x = i
    table.insert(Blocks, NewGrass)
end

function Ground:Draw()
    for index, value in pairs(Blocks) do
        local grass = value

        grass.x = grass.x - Globals.ObjectSpeed
        if grass.x < -36 then
            grass.x = love.graphics:getWidth()
        end

        love.graphics.draw(grassMiddle, love.graphics.newQuad(0, 0, 36, 36, 36, 36), grass.x, love.graphics:getHeight() - 36)
    end
end