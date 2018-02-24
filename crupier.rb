require_relative 'card_deck'
# Class for giving cards to draw and players
class Crupier
  def initialize(card_deck)
    @card_deck = card_deck
  end

  def draw
    play_draw = []
    5.times { play_draw << @card_deck.pop }
    play_draw
  end

  def hand
    play_hand = []
    2.times { play_hand << @card_deck.pop }
    play_hand
  end
end
