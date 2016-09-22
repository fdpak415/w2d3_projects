require 'rspec'
require 'functions'
require 'towers_of_hanoi'


describe '#my_uniq' do
  it 'removes duplicates from an array' do
    expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    expect([1,1,1,2,2,2,2,3,1,3,2].my_uniq).to eq([1,2,3])

  end

  it 'handles and empty array' do
    expect([].my_uniq).to eq([])
  end

  it 'does not mutate the array' do
    arr = [1,2,4,2,1,5]
    expect(arr.my_uniq).to_not be(arr)
  end

end

describe '#two_sum' do
  it 'returns positions where the values sum to zero' do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    expect([1, 0, 1, 0, 1].two_sum).to eq([[1,3]])
  end

  it 'handles and empty array' do
    expect([].two_sum).to eq([])
  end

end

describe '#my_transpose' do
  it 'transposes an array' do
    expect([[0, 1, 2],[3, 4, 5],[6, 7, 8]].my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
  end

  it "doesn't mutate the array" do
    arr = [[0, 3, 6],[1, 4, 7],[2, 5, 8]]
    expect(arr.my_transpose).to_not be(arr)
  end
end

describe '#stock_picker' do
  it "returns the most profitable days to buy and sell" do
    expect(stock_picker([2, 0, 3, 4, 12, 5, 3])).to eq([1, 4])
    expect(stock_picker([])).to eq([])
    expect(stock_picker([1,1,1,1,1,1,1,0,1,1,12,1,12,0,12])).to eq([7,10])
  end
end

describe TowersOfHanoi do
  let(:game) { TowersOfHanoi.new }

  describe '#initialize' do
    it 'creates a 2d array with 3 rings in first array' do
      expect(game.board.length).to eq(3)
      expect(game.board.first).to eq([1,2,3])
    end

  end

  describe '#move' do

    it 'moves a ring from one array to another' do
      game.move(0,1)
      expect(game.board.first).to eq([2,3])
      expect(game.board[1]).to eq([1])
    end

    it 'raises an error if a larger ring is moved onto a smaller ring' do
      game.move(0,1)
      expect { game.move(0,1) }.to raise_error('Invalid move!')
      expect {game.move(2,1)}.to raise_error('Invalid move!')
    end
  end

  describe '#won?' do
    it 'checks if a player has won the game' do
      expect(game.won?).to eq(false)
      game.board = [[],[1,2,3],[]]
      expect(game.won?).to eq(true)
      game.board = [[],[],[1,2,3]]
      expect(game.won?).to eq(true)
      game.board = [[],[1],[2,3]]
      expect(game.won?).to eq(false)
    end
  end
end
