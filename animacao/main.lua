function love.load()
  image = love.graphics.newImage("images/jump_2.png")
  local width = image:getWidth()
  local height = image:getHeight() 

  frames = {}

  local frame_width = 117
  local frame_height = 233

  maxFrames = 5
  for i=0,1 do
    for j=0,2 do
      table.insert(frames, love.graphics.newQuad(j * frame_width, i * frame_height, frame_width, frame_height, width, height))
      if #frames == maxFrames then
        break
      end 
    end
    print("I don't break!")
  end

  currentFrame = 1
end



function love.update(dt)
  currentFrame = currentFrame + 10 * dt
  if currentFrame >= 6 then
    currentFrame = 1
  end
end

function love.draw()
  love.graphics.draw(image, frames[math.floor(currentFrame)], 100, 100)
end