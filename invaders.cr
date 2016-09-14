require "./src/*"

game = Game.new()

while true
  sleep 0.4
  game.draw()
  game.tick()
end