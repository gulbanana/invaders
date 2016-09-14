class Sprite
    def initialize(frames : Array(String))
        @frame_count = 0
        @frames = frames
    end

    def draw(x : Int32, y : Int32)
        current_frame = @frames[@frame_count % @frames.size]

        line_y = y
        current_frame.split("\n").each do |line|
            Ansi.move(line_y, x * 20)
            print line
            line_y += 1
        end

        @frame_count += 1   
    end
end