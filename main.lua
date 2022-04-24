mainMenu = require "states/main_menu"
game = require "states/game"
game_over = require "states/game_over"

function love.load()
    love.window.setTitle("Baby Dash")
    Gamestate.registerEvents()
    Gamestate.switch(menu)
end