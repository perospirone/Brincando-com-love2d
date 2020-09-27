function love.load(arg)
  x = 300
  y = 300

  sheep = {}

  sheep.img = love.graphics.newImage("images/sheep.png")
  sheep.width = sheep.img:getWidth()
  sheep.height = sheep.img:getHeight()

  sheep.x = 100
  sheep.y = 100
  sheep.r = 0


  r1 = {
    x = 10,
    y = 100,
    width = 100,
    height = 100
  }

  r2 = {
    x = 250,
    y = 120,
    width = 150,
    height = 12
  }
end

function checkCollision(a, b)
  local a_left = a.x
  local a_right = a.x + a.width
  local a_top = a.y
  local a_bottom = a.y + a.height

  local b_left = b.x
  local b_right = b.x + b.width
  local b_top = b.y
  local b_bottom = b.y + b.height

    --If Red's right side is further to the right than Blue's left side.
    if a_right > b_left and
    --and Red's left side is further to the left than Blue's right side.
    a_left < b_right and
    --and Red's bottom side is further to the bottom than Blue's top side.
    a_bottom > b_top and
    --and Red's top side is further to the top than Blue's bottom side then..
    a_top < b_bottom then
        --There is collision!
        return true
    else
        --If one of these statements is false, return false.
        return false
    end
end

function love.update(dt)
  function love.mousepressed(x, y, button, isTouch)
  end

  function love.mousereleased(x, y, button, isTouch)
    -- print(x, y, button, isTouch)
  end

  function love.keypressed(key, scancode, isrepeat)
    print(key, scancode, isrepeat)
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
      x = x + 10
      y = math.random(0, 600)
    end
  end
  -- print(dt)

  r1.x = r1.x + 100 * dt
end

function love.draw()
  love.graphics.print('Olá Mundo!', 600, 480)
  -- love.graphics.circle("fill", x, y, 50, 100)
  -- love.graphics.draw(sheep.img, sheep.x, sheep.y, sheep.r, 1, 1, sheep.width/2, sheep.height/2)

  local mode
  if checkCollision(r1, r2) then
      --If there is collision, draw the rectangles filled
      mode = "fill"
  else
      --else, draw the rectangles as a line
      mode = "line"
  end

  --Use the variable as first argument
  love.graphics.rectangle(mode, r1.x, r1.y, r1.width, r1.height)
  love.graphics.rectangle(mode, r2.x, r2.y, r2.width, r2.height)end
