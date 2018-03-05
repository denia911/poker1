require_relative '../hand'

describe Hand do
  before do
    @draw = [[6, 'd'], [9, 's'], [10, 'c'], %w[K c], %w[A c]]
    @royal_flush_hand = [%w[Q c], %w[J c]]
    @straight_hand = [[7, 'd'], [8, 'd']]
    @one_pair_hand = [[2, 'd'], [10, 'd']]
  end

  it 'should be royal flush' do
    expect(Hand.new(@draw, @royal_flush_hand).check).to eq 'royal flush'
  end

  it 'should be straight' do
    expect(Hand.new(@draw, @straight_hand).check).to eq 'straight'
  end

  it 'should be one pair' do
    expect(Hand.new(@draw, @one_pair_hand).check).to eq 'one pair'
  end
end
