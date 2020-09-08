class HumanPlayer

  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)

    input_arr = nil
    while !legal_positions.include?(input_arr)
      puts "Player #{self.mark}, enter two numbers representing a position in the foramt `row, col`"
      input = gets.chomp.split(",")
      if input.length != 2
        puts "sorry, that was invalid. Please input legal position"
      else
        temp = input.map { |val| val.to_i }
        if !legal_positions.include?(temp)
          puts "sorry, that was illegal position. Please input legal position"
        else
          input_arr = temp
        end
      end
    end

    return input_arr

  end

end
