--! file: player.lua
Player = Object:extend()

window_height = love.graphics.getHeight()
window_width = love.graphics.getWidth()

function Player:new()
    self.image = love.graphics.rectangle("fill", 100, 50, 200, 150)
    self.x = window_width / 2
    self.y = window_height - 20 - 50
    self.width = 100
    self.height = 20
    self.speed = 500
    self.movement = "default"
end

function Player:update(dt)
  if love.keyboard.isDown("left") then
    self.x = self.x - self.speed * dt
    self.movement = "left"
  elseif love.keyboard.isDown("right") then
    self.x = self.x + self.speed * dt
    self.movement = "right"
  else
    self.movement = "default"
  end

    --Get the width of the window
    window_width = love.graphics.getWidth()

    --If the x is too far too the left then..
    if self.x < 0 then
        --Set x to 0
        self.x = 0

    --Else, if the x is too far to the right then..
    elseif self.x + self.width > window_width then
        --Set the x to the window's width.
        self.x = window_width - self.width
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end