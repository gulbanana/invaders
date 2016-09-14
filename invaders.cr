require "./src/*"

game = Game.new()

while !game.quit
  sleep 0.4
  game.poll()
  game.tick()
  game.draw()
end

system "clear"