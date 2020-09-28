function getDistance(x1, y1, x2, y2)
  local horizontal_distance = x1 - x2
  local vertical_distance = y1 - y2
  --Both of these work
  local a = horizontal_distance * horizontal_distance
  local b = vertical_distance ^2

  local c = a + b
  local distance = math.sqrt(c)
  return distance
end

function love.load()
  arrow = {}
  arrow.x = 200
  arrow.y = 200
  arrow.speed = 300
  arrow.angle = 0
  arrow.image = love.graphics.newImage("images/arrow_right.png")
  arrow.origin_x = arrow.image:getWidth() / 2
  arrow.origin_y = arrow.image:getHeight() / 2
end

function love.update(dt)
  mouse_x, mouse_y = love.mouse.getPosition()
  arrow.angle = math.atan2(mouse_y - arrow.y, mouse_x - arrow.x)
  cos = math.cos(arrow.angle)
  sin = math.sin(arrow.angle)

  arrow.x = arrow.x + arrow.speed * cos * dt
  arrow.y = arrow.y + arrow.speed * sin * dt
end

function love.draw()
  love.graphics.draw(arrow.image,
      arrow.x, arrow.y, arrow.angle, 1, 1,
      arrow.origin_x, arrow.origin_y)
  love.graphics.circle("fill", mouse_x, mouse_y, 5)
end