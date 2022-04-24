Gamestate = require "gamestate"

menu = {}
local titleFont = love.graphics.newFont("assets/fonts/Roboto.ttf", 36)
local normalFont = love.graphics.newFont("assets/fonts/Roboto.ttf", 24)
local introMusic = love.audio.newSource("assets/sounds/IntroMusic.mp3", "stream")

function menu:draw()
    love.graphics.setFont(titleFont)
    love.graphics.print("Baby Dash! (Demo)", 10, 10)
    love.graphics.setFont(normalFont)
    love.graphics.print("Press SPACEBAR to start", 10, 60)
end

function menu:update()
    if not introMusic:isPlaying() then
        introMusic:play()
    end
end

function menu:keyreleased(key, code)
    if key == "space" then
        introMusic:stop()
        Gamestate.switch(m_game)
    end
end