JumpPad = {x = love.graphics:getWidth() - 36, y = love.graphics:getHeight() - (36+36), w = 36, h = 36, canSpawn = true, hit = false}
local jumpPadTexture = love.graphics.newImage("assets/gfx/JumpPad2.png")
local jumpSound = love.audio.newSource("assets/sounds/jump.wav", "static")

function JumpPad:OnHit()
    jumpPadTexture = love.graphics.newImage("assets/gfx/JumpPad1.png")
    Player.yVel = -15
    Player.jumping = true
    jumpSound:play()
    self.hit = true
end

function JumpPad:Draw()
    if not self.hit then
        jumpPadTexture = love.graphics.newImage("assets/gfx/JumpPad2.png")
    end
    if self.canSpawn then
        love.graphics.draw(jumpPadTexture, love.graphics.newQuad(0, 0, 36, 36, 36, 36), self.x, love.graphics:getHeight() - (36+36))
        self.hit = false
    end
end