Gamestate = require "gamestate"

local ground = require "objects.ground"
local sky = require "objects.sky"
local player = require "objects.player"
local obstacles = require "objects.obstacle"
local collectables = require "objects.collectable"

local hpbar = require "gui.healthbar"
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
    Healthbar:Draw()
    CoinCounter:Draw()
    Player:Draw()

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