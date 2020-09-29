function love.load()
  song = love.audio.newSource("songs/song.ogg", "stream")
  song:setVolume(0.2)
  song:setLooping(true)
  song:play()

  sfx = love.audio.newSource('songs/sfx.ogg', 'stream')
end

function love.update()
  function love.keypressed(key)
    if key == 'space' then
      sfx:play()
    end
  end
end

function love.draw()
end
