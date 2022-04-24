CoinCounter = {}

local globals = require "globals"
local normalFont = love.graphics.newFont("assets/fonts/Roboto.ttf", 20)

function CoinCounter:Draw()
    love.graphics.setFont(normalFont)
    love.graphics.setColor(0,0,0)
    love.graphics.print("Coins: " .. Globals.PlayerCoins, 10, 10)
    love.graphics.setColor(Globals.DefaultColour.r, Globals.DefaultColour.g, Globals.DefaultColour.b)
end