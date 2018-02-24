require_relative '../winner'

describe Winner do
  before do
    @player1_flush = [[[6], ['flush'], ['player1']],
                      [[2], ['one pair'], ['player2']]]
    @players2_pair = [[[2], ['one pair'], ['player1']],
                      [[2], ['one pair'], ['player2']]]
  end

  it 'should be player1 with flush combination' do
    winner = Winner.new(@player1_flush)
    expect(winner.winner.join(', ')).to eq 'flush, player1'
  end

  it 'should be player1 and player2 with one pair combination' do
    winner = Winner.new(@players2_pair)
    expect(winner.winner.join(', ')).to eq 'one pair, player1, player2'
  end
end
