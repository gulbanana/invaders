module Ansi
  def self.clear()
    print "\33[2J"
  end

  # tput cup #{l} #{c} = \E[%i%p1%d;%p2%dH
  def self.move(l : Int32, c : Int32)
    print "\33[#{l+1};#{c+1}H"
  end
end