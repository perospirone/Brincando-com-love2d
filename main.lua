function love.load()
  Object = require "classic"
  require "player"
  require "enemy"
  require "bullet"

  player = Player()
  enemy = Enemy()
  listOfBullets = {}
end

function love.update(dt)
  player:update(dt)
  enemy:update(dt)

  function love.keypressed(key)
    player:keyPressed(key)
  end


  for i,v in ipairs(listOfBullets) do
    v:update(dt)
    v:checkCollision(enemy)

    --If the bullet has the property dead and it's true then..
    if v.dead then
      --Remove it from the list
      table.remove(listOfBullets, i)
    end
  end
end

function love.draw()
  player:draw()
  enemy:draw()

  for i,v in ipairs(listOfBullets) do
    v:draw()
  end
end
