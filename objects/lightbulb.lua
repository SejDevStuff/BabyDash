LightBulb = {x = love.graphics:getWidth() - 36, y = love.graphics:getHeight() - (36+36), w = 36, h = 36, canSpawn = true}
local lightbulbTex = love.graphics.newImage("assets/gfx/powerup.png")

function LightBulb:OnHit()
    math.randomseed(os.clock()*100000000000)
    self.canSpawn = false
    local powerup = math.random(1,3)
    if (Globals.CurrentPowerup == 0) then
        Globals.CurrentPowerup = powerup
        Globals.PowerupEnd = os.time() + math.random(3,8)
    end
end

function LightBulb:Draw()
    if self.canSpawn then
        love.graphics.draw(lightbulbTex, love.graphics.newQuad(0, 0, 36, 36, 36, 36), self.x, love.graphics:getHeight() - (36+36))
    end
end