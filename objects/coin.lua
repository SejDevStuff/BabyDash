Coin = {x = love.graphics:getWidth() - 36, y = love.graphics:getHeight() - (36+36), w = 36, h = 36, canSpawn = true}
local coinTexture = love.graphics.newImage("assets/gfx/CoinSpin1.png")
local lastTexChange = 0
local curTex = 1
local socket = require "socket"
local coinPickup = love.audio.newSource("assets/sounds/coinPickup.wav", "static")

function Coin:OnHit()
    self.canSpawn = false
    coinPickup:play()
    Globals.PlayerCoins = Globals.PlayerCoins + 1
end

function Coin:Draw()
    if ((socket.gettime() - lastTexChange) > 0.07) then
        lastTexChange = socket.gettime()
        curTex = curTex + 1
        if curTex > 6 then
            curTex = 1
        end
        coinTexture = love.graphics.newImage("assets/gfx/CoinSpin" .. curTex .. ".png")
    end

    if self.canSpawn then
        love.graphics.draw(coinTexture, love.graphics.newQuad(0, 0, 36, 36, 36, 36), self.x, love.graphics:getHeight() - (36+36))
    end
end