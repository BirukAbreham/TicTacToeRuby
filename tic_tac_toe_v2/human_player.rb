class HumanPlayer

  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position
    puts "Plaer #{self.mark}, enter two numbers representing a position in the format `row, col`"
    input = gets.chomp.split(",")
    if input.length != 2
      raise "sorry, that was invalid :("
    else
      input_arr = input.map { |val| val.to_i }
      p input_arr
      return input_arr
    end
  end

end
