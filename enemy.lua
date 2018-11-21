--! file: enemy.lua
Enemy = Object:extend()

window_height = love.graphics.getHeight()
window_width = love.graphics.getWidth()

function Enemy:new()
    self.image = love.graphics.rectangle("fill", 100, 50, 200, 150)
    self.x = window_width / 2
    self.y = 50
    self.width = 100
    self.height = 20
    self.speed = 300
end

function Enemy:update(dt)

    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0
        self.speed = -self.speed
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        self.speed = -self.speed
    end
end

function Enemy:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end