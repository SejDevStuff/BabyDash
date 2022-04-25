Snowman = {x = love.graphics:getWidth() - 36, y = love.graphics:getHeight() - (36+36), w = 36, h = 36, canSpawn = true}
local snowmanTex = love.graphics.newImage("assets/gfx/Snowman.png")
local hurtSfx = love.audio.newSource("assets/sounds/brianDeath1.mp3", "static")

local globals = require "globals"

function Snowman:OnHit()
    self.canSpawn = false
    Globals.ObjectSpeed = 1.5
    if (Globals.ObjSpdResetTime > os.time()) then
        Globals.ObjSpdResetTime = Globals.ObjSpdResetTime + 3
    else
        Globals.ObjSpdResetTime = os.time() + 3
    end
    Globals.PlayerHP = Globals.PlayerHP - 5
    hurtSfx:play()
end

function Snowman:Draw()
    if self.canSpawn then
        love.graphics.draw(snowmanTex, love.graphics.newQuad(0, 0, 36, 36, 36, 36), self.x, self.y)
    end
end