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
end

function m_game:update()
    Player:Regen()

    if (Globals.PlayerHP <= 0) then
        Globals.PlayerHP = 0
        deathSfx:play()
        Gamestate.switch(gameOver)
    end
end