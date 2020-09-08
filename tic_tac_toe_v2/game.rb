require "./board"
require "./human_player"

class Game
  
  def initialize(board_size, *player_marks)
    @players = player_marks.map { |mark| HumanPlayer.new(mark) }
    @board = Board.new(board_size)
    @current_player = @players[0]
  end

  def switch_turn
    @players.rotate!(1)
    @current_player = @players[0]
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(
        @current_player.get_position, 
        @current_player.mark
      )
      if @board.win?(@current_player.mark)
        puts "*** Player #{@current_player.mark} Won the game ***"
        @board.print
        return
      else
        self.switch_turn
      end
    end
    if !@board.empty_positions?
      puts "Draw the game has no winner"
      @board.print
    end
  end

end
