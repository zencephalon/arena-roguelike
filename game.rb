require 'io/console'


class Arena
  def initialize(x = 40, y = 12)
    @x = x
    @y = y
  end

  def render(x, y)
    str = "#" * x
    (y - 2).times do
      str << "#" + " " * (x - 2) + "#"
    end
    str << "#" * x
  end
end


class Renderer
  def initialize
    @x = 80
    @y = 24
    @stack = []
  end

  def clear
    system "clear"
  end

  def render
    clear

    (0...@y).each do |y|
      (0...@x).each do |x|
        print "·"
      end
      puts
    end
  end
end

class Game
  def initialize
    @renderer = Renderer.new
    run
  end

  def run
    while true
      # take input
      # modify game state
      input = read_char
      if input == 'q'
        exit
      end
      @renderer.render
    end
  end

  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end 
end

game = Game.new
