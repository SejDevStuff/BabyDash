Gamestate = require "gamestate"

local ground = require "objects.ground"
local sky = require "objects.sky"
local player = require "objects.player"
local obstacles = require "objects.obstacle"
local collectables = require "objects.collectable"

local coinCount = require "gui.coincounter"

local deathSfx = love.audio.newSource("assets/sounds/death.wav", "static")

m_game = {}

function m_game:reset()
    Globals:Reset()
    Player.y = love.graphics:getHeight() / 2
    Player.yVel = 0
    Player.jumping = true
    Collectables = {}
    Obstacles = {}
end

function m_game:draw()
    Sky:Draw()
    Ground:Draw()
    Obstacle:DrawIfChance()
    Collectable:DrawIfCan()
    CoinCounter:Draw()
    Player:Draw()

    if (Globals.CurrentPowerup ~= 0) then
        love.graphics.setColor(0,0,0)
        local timeRemaining = Globals.PowerupEnd - os.time()
        if timeRemaining <= 0 then
            Globals.CurrentPowerup = 0
        else
            if (Globals.CurrentPowerup == 1) then
                love.graphics.print("Active Powerup: AGILITY (" .. timeRemaining .. "s remaining)", 10,80)
            end
            if (Globals.CurrentPowerup == 2) then
                love.graphics.print("Active Powerup: INVINCIBILITY (" .. timeRemaining .. "s remaining)", 10,80)
            end
            if (Globals.CurrentPowerup == 3) then
                love.graphics.print("Active Powerup: REGENERATION (" .. timeRemaining .. "s remaining)", 10,80)
            end
        end
        love.graphics.setColor(Globals.DefaultColour.r, Globals.DefaultColour.g, Globals.DefaultColour.b)
    end

    if (os.time() >= Globals.ObjSpdResetTime) then
        Globals.ObjectSpeed = Globals.DefaultObjSpeed
        Globals:SetDefaultColour(1,1,1)
    else
        love.graphics.setColor(0,0,0)
        love.graphics.print("You're slow for " .. (Globals.ObjSpdResetTime - os.time()) .. "s!", 10,50)
        love.graphics.setColor(0.7,0.7,0.7)
        Globals:SetDefaultColour(0.7, 0.7, 0.7)
    end
end

function m_game:update()
    Player:Regen()
    if (Globals.PlayerHP <= 0) then
        Globals.PlayerHP = 0
        deathSfx:play()
        Gamestate.switch(gameOver)
    end
end

function m_game:keypressed(key, scancode)
    if (key == "h") then
        if (Globals.ShowHitboxes) then
            Globals.ShowHitboxes = false
        else
            Globals.ShowHitboxes = true
        end
    end
end