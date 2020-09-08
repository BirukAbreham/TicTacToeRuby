class ComputerPlayer
  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)
    computer_position = legal_positions.sample
    puts "Computer #{self.mark} marks position #{computer_position}"
    computer_position
  end

end
