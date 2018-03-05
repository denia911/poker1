# Class for card
class Card
  def initialize
    @cards = cards
  end

  def cards
    cards = (2..10).to_a
    cards << 'J'
    cards << 'Q'
    cards << 'K'
    cards << 'A'
    cards
  end
end
