require 'rubygems'
require 'mini_magick'

class Mocking
  puts "what is something that bothers you?"
  @@input = gets.chomp

  def word_fix
    @fixed = "#{@@input.chars.map { |a| (rand 2) == 0 ? a : a.upcase }.join}!"
  end

  def fixToPic
    image = MiniMagick::Image.open("/Users/lilbits/Desktop/retest.jpg")
    image.combine_options do |c|
      c.gravity 'south'
      c.splice "0x30"
      c.fill 'black'
      c.pointsize 30
      c.annotate 0, "#{@fixed}"
    end
    image.write("fixed.jpg")
  end

end

a = Mocking.new
a.word_fix
a.fixToPic