require_relative '../hand'

describe Hand do
  before do
    @draw = [[6, 'd'], [9, 's'], [10, 'c'], %w[K c], %w[A c]]
    @royal_flush_hand = [%w[Q c], %w[J c]]
    @straight_hand = [[7, 'd'], [8, 'd']]
    @one_pair_hand = [[2, 'd'], [10, 'd']]
  end

  it 'should be royal flush, 10 points' do
    expect(Hand.new(@draw, @royal_flush_hand).score).to eq [10, 'royal flush']
  end

  it 'should be straight, 5 points' do
    expect(Hand.new(@draw, @straight_hand).score).to eq [5, 'straight']
  end

  it 'should be one pair, 2 points' do
    expect(Hand.new(@draw, @one_pair_hand).score).to eq [2, 'one pair']
  end

  it 'should be not full house' do
    expect(Hand.new(@draw, @one_pair_hand).full_house?).to eq false
  end

  it 'should be straight flush, 10 points' do
    expect(Hand.new(@draw, @royal_flush_hand).straight_flush?).to eq true
  end
end
