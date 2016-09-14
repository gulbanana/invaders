class Bouncer
    def initialize(limit : Int32)
        @x = 0
        @dx = +1
        @lim = limit
    end

    def tick()
        @x += @dx
        if (@x < 1 || @x > @lim - 1)
            @dx = @dx * -1
        end
    end
    
    def x
        return @x
    end
end