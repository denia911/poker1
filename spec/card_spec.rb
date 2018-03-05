require_relative '../card'

describe Card do
  before { @cards = Card.new }

  it 'should be 13 cards of 1 suit' do
    expect(@cards.cards.length).to eq 13
  end
end
