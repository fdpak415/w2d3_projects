class TowersOfHanoi
attr_accessor :board

  def initialize
    @board = [[1,2,3], [], []]
  end

  def move(start, end_pos)
    raise "Invalid move!" if @board[start].empty?
    disc = @board[start].shift
    raise "Invalid move!" unless @board[end_pos].empty? || disc < @board[end_pos].first
    @board[end_pos].unshift(disc)
  end

  def won?
    return true if @board[1] == [1,2,3] || @board[2] == [1,2,3]
    false
  end

  def play
    until won?
      p @board
      puts 'Enter move:'
      start, end_pos  = gets.chomp.split(',')
      move(start.to_i, end_pos.to_i)
    end
    puts "You won you beautiful bastard!"
  end
end



if __FILE__ == $0
  game = TowersOfHanoi.new
  game.play

end
