require "./board"
require "./human_player"

class Game
  
  def initialize(player_1_mark, player_2_mark)
    @player_one = HumanPlayer.new(player_1_mark)
    @player_two = HumanPlayer.new(player_2_mark)
    @board = Board.new
    @current_player = @player_one
  end

  def switch_turn
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
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
