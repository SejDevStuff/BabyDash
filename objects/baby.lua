Baby = {x = love.graphics:getWidth() - 48, y = love.graphics:getHeight() - (36+46), w = 48, h = 48, canSpawn = true}

local tex = love.graphics.newImage("assets/gfx/baby1.png")
local lastTexChange = 0
local texId = 1
local socket = require "socket"

local hurtSfx = love.audio.newSource("assets/sounds/brianDeath1.mp3", "static")

function Baby:OnHit()
    self.canSpawn = false
    hurtSfx:play()
    Globals.PlayerHP = Globals.PlayerHP - 30
end

function Baby:Draw()
    if ((socket.gettime() - lastTexChange) >= 0.08) then
        lastTexChange = socket.gettime()
        texId = texId + 1
        if texId > 8 then
            texId = 1
        end
        tex = love.graphics.newImage("assets/gfx/baby" .. texId .. ".png")
    end

    if self.canSpawn then
        love.graphics.draw(tex, love.graphics.newQuad(0, 0, 48, 48, 48, 48), self.x, self.y)
    end
end