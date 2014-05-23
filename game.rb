require 'io/console'

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

class Arena
  MAP = "######\n#    #\n#    #\n#    #\n######"


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
        print "."
      end
      puts
    end
  end
end

r = Renderer.new
r.render
puts "hello"
r.render
