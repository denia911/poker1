require_relative '../card_deck'

describe CardDeck do
  before { @card_deck = CardDeck.new }

  it 'should be 52 cards in 1 deck' do
    expect(@card_deck.deck.length).to eq 52
  end

  it 'should be 52 cards in 1 mixed deck' do
    expect(@card_deck.mix_deck.length).to eq 52
  end

  it 'mixed deck not deck' do
    expect(@card_deck.deck).not_to eq(@card_deck.mix_deck)
  end
end
