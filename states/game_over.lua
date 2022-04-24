Gamestate = require "gamestate"

gameOver = {}
local titleFont = love.graphics.newFont("assets/fonts/Roboto.ttf", 36)
local normalFont = love.graphics.newFont("assets/fonts/Roboto.ttf", 24)

function gameOver:draw()
    love.graphics.setFont(titleFont)
    love.graphics.print("Game Over! (You died)", 10, 10)
    love.graphics.setFont(normalFont)
    love.graphics.print("Press SPACEBAR to retry", 10, 60)
end

function gameOver:keyreleased(key, code)
    if key == "space" then
        m_game:reset()
        Gamestate.switch(m_game)
    end
end