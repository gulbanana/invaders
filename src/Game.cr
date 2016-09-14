class Game
    @army1 : Array(Sprite)
    @army2 : Array(Sprite)
    @army3 : Array(Sprite)

    def initialize()
        @boss = Sprite.new([Data::MOTHERSHIP])
        @boss_x = Bouncer.new(6)
        
        @army1 = (1..4).map { Sprite.new([Data::ENEMY_2_DOWN, Data::ENEMY_2_DOWN, Data::ENEMY_2_UP, Data::ENEMY_2_UP]) }
        @army2 = (1..4).map { Sprite.new([Data::ENEMY_1_DOWN, Data::ENEMY_1_UP]) } 
        @army3 = (1..4).map { Sprite.new([Data::ENEMY_1_DOWN, Data::ENEMY_1_UP]) }
        @army_x = Bouncer.new(3)

        @command = Command::Help
        @quit = false

        Curses.initscr()
        Curses.curs_set(0)
        Curses.cbreak()
    end

    def draw()
        Ansi.clear()

        @boss.draw(@boss_x.x, 0)

        offset = 0
        @army1.each do |s|
            s.draw(@army_x.x + offset, 7)
            offset += 1
        end

        offset = 0
        @army2.each do |s|
            s.draw(@army_x.x + offset, 14)
            offset += 1
        end

        offset = 0
        @army3.each do |s|
            s.draw(@army_x.x + offset, 21)
            offset += 1
        end

        if (@command == Command::Help)
            Ansi.move(28, 0)
            puts "spacebar : fire"
            Ansi.move(29, 0)
            puts ", : move left\ntest"
            Ansi.move(30, 0)
            puts ". : move right"
            Ansi.move(31, 0)
            puts "q : quit"
        end
    end

    def poll()
        input = Curses.getch() 
        if (input == 44)
            @command = Command::Left
        elsif (input == 46)
            @command = Command::Right
        elsif (input == 32)
            @command = Command::Fire
        elsif (input == 113)
            @command = Command::Quit
        elsif (input == -1)
        else
            @command = Command::Help
        end
    end

    def tick()
        @boss_x.tick()
        @army_x.tick()

        if (@command == Command::Quit)
            Curses.endwin()
            @quit = true
        end
    end

    def quit
        return @quit
    end
end