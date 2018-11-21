--! file: main.lua
function love.load()
    Object = require "classic"
    require "player"
    require "enemy"
    require "ball"

    player = Player()
    enemy = Enemy()
    ball = Ball()
    
    window_height = love.graphics.getHeight()
    window_width = love.graphics.getWidth()
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)
    ball:update(dt)
    ball:checkCollision(player)
    ball:checkCollision(enemy)
end

function love.draw()
    player:draw()
    enemy:draw()
    ball:draw()
    
    love.graphics.print(player.movement, 0, 0)
end

