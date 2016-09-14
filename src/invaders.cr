require "./invaders/*"

while true
  sleep 0.2
  puts Ansi::CLEAR
  puts Game::ENEMY_DOWN

  sleep 0.2
  puts Ansi::CLEAR
  puts Game::ENEMY_UP 
end

