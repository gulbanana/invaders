require "./invaders/*"

sprites1 = (1..4).map { Sprite.new([Data::ENEMY_2_DOWN, Data::ENEMY_2_DOWN, Data::ENEMY_2_UP, Data::ENEMY_2_UP]) }
sprites2 = (1..4).map { Sprite.new([Data::ENEMY_1_DOWN, Data::ENEMY_1_UP]) } 
sprites3 = (1..4).map { Sprite.new([Data::ENEMY_1_DOWN, Data::ENEMY_1_UP]) }

x_offset = 0
while true
  sleep 0.4
  Ansi.clear()

  x = x_offset % 4
  sprites1.each do |s|
    s.draw(x, 1)
    x += 1
  end

  x = x_offset % 4
  sprites2.each do |s|
    s.draw(x, 8)
    x += 1
  end

  x =  x_offset % 4
  sprites3.each do |s|
    s.draw(x, 15)
    x += 1
  end

  x_offset += 1
end