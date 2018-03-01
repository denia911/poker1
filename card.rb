# Class for card
class Card
  def cards
    cards = (2..10).to_a
    cards << 'J'
    cards << 'Q'
    cards << 'K'
    cards << 'A'
    cards
  end
end
