Tree = {x = love.graphics:getWidth() - 36, y = love.graphics:getHeight() - (36+36), w = 36, h = 36, canSpawn = true}
local treeTexture = love.graphics.newImage("assets/gfx/Tree.png")
local hurtSfx = love.audio.newSource("assets/sounds/brianDeath1.mp3", "static")

local globals = require "globals"

function Tree:OnHit()
    self.canSpawn = false
    if Globals.CurrentPowerup ~= 1 then
        Globals.ObjectSpeed = 1.5
        if (Globals.ObjSpdResetTime > os.time()) then
            Globals.ObjSpdResetTime = Globals.ObjSpdResetTime + 5
        else
            Globals.ObjSpdResetTime = os.time() + 5
        end
        Globals.PlayerHP = Globals.PlayerHP - 5
        hurtSfx:play()
    end
end

function Tree:Draw()
    if self.canSpawn then
        love.graphics.draw(treeTexture, love.graphics.newQuad(0, 0, 36, 36, 36, 36), self.x, self.y)
    end
end