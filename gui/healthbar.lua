Healthbar = {}

local globals = require "globals"
local normalFont = love.graphics.newFont("assets/fonts/Roboto.ttf", 18)

function Healthbar:Draw()
    love.graphics.setFont(normalFont)
    love.graphics.setColor(0,0,0)
    love.graphics.print(Globals.PlayerHP .. " HP", 50, Player.y - 20)
    love.graphics.setColor(1,1,1)
end