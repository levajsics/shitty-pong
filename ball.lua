--! file: ball.lua
Ball = Object:extend()

window_height = love.graphics.getHeight()
window_width = love.graphics.getWidth()

function Ball:new()
    self.x = 100
    self.y = 100
    self.width = 20
    self.height = 20
    self.speed_x = 500
    self.speed_y = 500
end

function Ball:update(dt)
  
    self.x = self.x + self.speed_x * dt
    self.y = self.y + self.speed_y * dt    

    if self.x < 0 then
      self.x = 0
      self.speed_x = -self.speed_x
    elseif self.x + self.width > window_width then
      self.x = window_width - self.width
      self.speed_x = -self.speed_x
    end
    
    if self.y < 0 then
      self.y = 0
      self.speed_y = -self.speed_y
    elseif self.y + self.height > window_height then
      self.y = window_height - self.height
      self.speed_y = -self.speed_y
    end
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Ball:checkCollision(obj)
    local self_left = self.x
    local self_right = self.x + self.width
    local self_top = self.y
    local self_bottom = self.y + self.height

    local obj_left = obj.x
    local obj_right = obj.x + obj.width
    local obj_top = obj.y
    local obj_bottom = obj.y + obj.height

    if self_right > obj_left and
    self_left < obj_right and
    self_bottom > obj_top and
    self_top < obj_bottom then
        
        self.speed_y = -self.speed_y
        
    end
end