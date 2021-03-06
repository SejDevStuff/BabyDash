local socket = require 'socket'
local hpbar = require "gui.healthbar"
local globals = require "globals"

local playerTexture = love.graphics.newImage("assets/gfx/brian_run_1.png")
local currentTexture = 1
local lastTextureChange = 0
local lastRegenTime = 0

Player = {y = love.graphics:getHeight() / 2, yVel = 0, jumping = true}

function Player:Regen()
    local timeDiff = 1
    if Globals.CurrentPowerup == 3 then
        timeDiff = 0.5
    end
    if ((socket.gettime() - lastRegenTime) >= timeDiff) then
        if (Globals.PlayerHP < 70) then
            lastRegenTime = socket.gettime()
            Globals.PlayerHP = Globals.PlayerHP + 1
        end
    end
end

function Player:Draw()
    -- handle player anim
    if Player.jumping == false then
        if (socket.gettime() - lastTextureChange) > 0.04 * ((Globals.DefaultObjSpeed - Globals.ObjectSpeed) + 1) then
            lastTextureChange = socket.gettime()
            currentTexture = currentTexture + 1
            if currentTexture > 9 then
                currentTexture = 1
            end
            playerTexture = love.graphics.newImage("assets/gfx/brian_run_" .. currentTexture .. ".png")
        end
    end

    -- jump
    if Player.jumping == false then
        if love.keyboard.isDown("space") then
            Player.yVel = -12 - (Globals.DefaultObjSpeed - Globals.ObjectSpeed)
            Player.jumping = true
        end
    end

    -- gravity
    if Player.y < love.graphics:getHeight() - (36+64) then
        Player.yVel = Player.yVel + 0.5
    end

    Player.y = Player.y + Player.yVel

    -- fix y
    if Player.y > love.graphics:getHeight() - (36+64) then
        Player.y = love.graphics:getHeight() - (36+64)
        Player.jumping = false
    end

    -- draw hitbox
    if (Globals.ShowHitboxes) then
        love.graphics.setColor(0,255,0)
        love.graphics.rectangle("fill", 62, Player.y, 36, 64)
        love.graphics.setColor(255,255,255)
    end

    -- draw hp bar
    Healthbar:Draw()

    -- draw player
    love.graphics.draw(playerTexture, love.graphics.newQuad(0, 0, 64, 64, 64, 64), 50, Player.y)
end