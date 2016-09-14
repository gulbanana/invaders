class Game
    @army1 : Array(Sprite)
    @army2 : Array(Sprite)
    @army3 : Array(Sprite)

    def initialize()
        @boss = Sprite.new([Data::MOTHERSHIP])
        @boss_x = Bouncer.new(6)
        
        @army1 = (1..4).map { Sprite.new([Data::ENEMY_2_DOWN, Data::ENEMY_2_DOWN, Data::ENEMY_2_DOWN, Data::ENEMY_2_DOWN, Data::ENEMY_2_UP, Data::ENEMY_2_UP, Data::ENEMY_2_UP]) }
        @army2 = (1..4).map { Sprite.new([Data::ENEMY_1_DOWN, Data::ENEMY_1_UP, Data::ENEMY_1_UP]) } 
        @army3 = (1..4).map { Sprite.new([Data::ENEMY_1_DOWN, Data::ENEMY_1_DOWN, Data::ENEMY_1_UP, Data::ENEMY_1_UP]) }
        @army_x = Bouncer.new(3)

        @player = Sprite.new([Data::PLAYER])
        @player_x = 3

        @command = Command::Help
        @quit = false

        Ansi.resize(42, 140)

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

        @player.draw(@player_x, 35)

        if (@command == Command::Help)
            Ansi.move(38, 0)
            print "spacebar : fire"
            Ansi.move(39, 0)
            print ", : move left\ntest"
            Ansi.move(40, 0)
            print ". : move right"
            Ansi.move(41, 0)
            print "q : quit"
        end
    end

    def poll()
        if (@command != Command::Help)
            @command = Command::None
        end

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

        case @command
            when Command::Quit
                Curses.endwin()
                @quit = true
            when Command::Left
                @player_x = [@player_x - 1, 0].max
            when Command::Right
                @player_x = [@player_x + 1, 6].min
        end
    end

    def quit
        return @quit
    end
end