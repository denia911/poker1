# Class for creating card deck
class CardDeck
  def initialize
    @deck = deck
  end

  def card
    cards = (2..10).to_a
    cards << 'J'
    cards << 'Q'
    cards << 'K'
    cards << 'A'
    cards
  end

  def deck
    cards = card
    suits = %w[h d s c]
    card_deck = []
    4.times do |take_suit|
      card_deck += cards.map do |elem|
        [elem, suits[take_suit]]
      end
    end
    card_deck
  end

  def mix_deck
    @deck.shuffle!
    @deck
  end
end
