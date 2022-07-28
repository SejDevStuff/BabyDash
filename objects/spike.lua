Spike = {x = love.graphics:getWidth() - 36, y = love.graphics:getHeight() - (36+36), w = 36, h = 36, canSpawn = true}
local spikeTexture = love.graphics.newImage("assets/gfx/Spike.png")
local hurtSfx = love.audio.newSource("assets/sounds/brianDeath1.mp3", "static")

function Spike:OnHit()
    self.canSpawn = false
    if Globals.CurrentPowerup ~= 2 then
        hurtSfx:play()
        Globals.PlayerHP = Globals.PlayerHP - 50
    end
end

function Spike:Draw()
    if self.canSpawn then
        love.graphics.draw(spikeTexture, love.graphics.newQuad(0, 0, 36, 36, 36, 36), self.x, love.graphics:getHeight() - (36+36))
    end
end