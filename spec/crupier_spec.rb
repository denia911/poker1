require_relative '../crupier'
require_relative '../card_deck'

describe Crupier do
  before do
    @card_deck = CardDeck.new.mix_deck
    @crupier = Crupier.new(@card_deck)
  end

  it 'should be 5 cards at draw' do
    expect(@crupier.draw.length).to eq 5
  end

  it 'shoud be 2 cards at players hand' do
    expect(@crupier.hand.length).to eq 2
  end

  it 'should be 50 cards at card deck after taking to player hand' do
    @crupier.hand
    expect(@card_deck.length).to eq 50
  end

  it 'should be 47 cards at card deck after taking to the draw' do
    @crupier.draw
    expect(@card_deck.length).to eq 47
  end
end
