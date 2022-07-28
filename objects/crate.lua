Crate = {x = love.graphics:getWidth() - 36, y = love.graphics:getHeight() - (36+36), w = 36, h = 36, canSpawn = true}
local crateTex = love.graphics.newImage("assets/gfx/Crate.png")
local hurtSfx = love.audio.newSource("assets/sounds/brianDeath1.mp3", "static")

local globals = require "globals"

function Crate:OnHit()
    self.canSpawn = false
    if Globals.CurrentPowerup ~= 1 then
        Globals.ObjectSpeed = 1.5
        if (Globals.ObjSpdResetTime > os.time()) then
            Globals.ObjSpdResetTime = Globals.ObjSpdResetTime + 2
        else
            Globals.ObjSpdResetTime = os.time() + 2
        end
        Globals.PlayerHP = Globals.PlayerHP - 5
        hurtSfx:play()
    end
end

function Crate:Draw()
    if self.canSpawn then
        love.graphics.draw(crateTex, love.graphics.newQuad(0, 0, 36, 36, 36, 36), self.x, self.y)
    end
end