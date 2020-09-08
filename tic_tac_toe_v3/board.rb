class Board
  
  def initialize(size)
    @grid = Array.new(size) { Array.new(size, "_") }
  end

  def valid?(position)
    return true if position[0] < @grid.length && position[1] < @grid.length
    false
  end

  def empty?(position)
    return true if @grid[position[0]][position[1]] == "_"
    false
  end

  def place_mark(position, mark)
    if self.valid?(position) && self.empty?(position)
      @grid[position[0]][position[1]] = mark
    else
      raise "invalid mark"
    end
  end

  def print
    puts "["
    @grid.each do |row|
      puts "\t#{row}\n"
    end
    puts "]"
  end

  def win_row?(mark)
    @grid.each do |row|
      return row.all? { |cell| cell == mark }
    end
  end

  def win_col?(mark)
    transposed = @grid.transpose
    transposed.each do |col|
      return col.all? { |cell| cell == mark }
    end
  end

  def win_diagonal?(mark)
    pos_diagonal = []
    neg_diagonal = []
    (0...@grid.length).each do |r|
      (0...@grid.length).each do |c|
        pos_diagonal << @grid[r][c] if r == c
        neg_diagonal << @grid[r][c] if (r+c) == (@grid.length-1)
      end
    end
    is_pos = pos_diagonal.all? { |cell| cell == mark }
    is_neg = neg_diagonal.all? { |cell| cell == mark }
    return true if is_pos || is_neg
    false
  end

  def win?(mark)
    self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
  end

  def empty_positions?
    @grid.each do |row|
      return true if row.any? { |cell| cell == "_" }
    end
    false
  end
  
  def legal_positions
    unmarked_legal = []
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2|
        unmarked_legal << [idx1, idx2] if col == "_"
      end
    end
    unmarked_legal
  end

end
