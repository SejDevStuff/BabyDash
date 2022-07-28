Bird = {x = love.graphics:getWidth() - 36, y = love.graphics:getHeight() - (36 * 5), w = 36, h = 36, canSpawn = true}

local tex = love.graphics.newImage("assets/gfx/birdflap1.png")
local lastTexChange = 0
local texId = 1
local socket = require "socket"

local hurtSfx = love.audio.newSource("assets/sounds/brianDeath1.mp3", "static")

function Bird:OnHit()
    self.canSpawn = false
    if Globals.CurrentPowerup ~= 2 then
        hurtSfx:play()
        Globals.PlayerHP = Globals.PlayerHP - 20
    end
end

function Bird:Draw()
    self.x = self.x - 3
    if ((socket.gettime() - lastTexChange) >= 0.08) then
        lastTexChange = socket.gettime()
        texId = texId + 1
        if texId > 9 then
            texId = 1
        end
        tex = love.graphics.newImage("assets/gfx/birdflap" .. texId .. ".png")
    end

    if self.canSpawn then
        love.graphics.draw(tex, love.graphics.newQuad(0, 0, self.w, self.h, self.w, self.h), self.x, self.y)
    end
end