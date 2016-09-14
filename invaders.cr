require "./src/*"

game = Game.new()

while !game.quit
  sleep 0.25
  game.poll()
  game.tick()
  game.draw()
end

system "clear"