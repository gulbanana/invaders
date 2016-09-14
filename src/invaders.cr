require "./invaders/*"

boss = Sprite.new([Data::MOTHERSHIP])

sprites1 = (1..4).map { Sprite.new([Data::ENEMY_2_DOWN, Data::ENEMY_2_DOWN, Data::ENEMY_2_UP, Data::ENEMY_2_UP]) }
sprites2 = (1..4).map { Sprite.new([Data::ENEMY_1_DOWN, Data::ENEMY_1_UP]) } 
sprites3 = (1..4).map { Sprite.new([Data::ENEMY_1_DOWN, Data::ENEMY_1_UP]) }

x_base = 0
x_off = 1
while true
  sleep 0.4
  Ansi.clear()

  boss.draw(x_base, 0)

  x = x_base
  sprites1.each do |s|
    s.draw(x, 7)
    x += 1
  end

  x = x_base
  sprites2.each do |s|
    s.draw(x, 14)
    x += 1
  end

  x = x_base
  sprites3.each do |s|
    s.draw(x, 21)
    x += 1
  end

  x_base += x_off
  if (x_base > 2 || x_base < 1)
    x_off = x_off * -1
  end
end