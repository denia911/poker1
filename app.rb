require_relative 'card_deck'
require_relative 'hand'
require_relative 'crupier'
require_relative 'winner'

card_deck = CardDeck.new.mix_deck
play_draw = Crupier.new(card_deck).draw
puts "Cards on table #{play_draw}"
player1_card = Crupier.new(CardDeck.new.mix_deck).hand
puts "Players 1 cards #{player1_card}"
player2_card = Crupier.new(CardDeck.new.mix_deck).hand
puts "Players 2 cards #{player2_card}"

player1_card_score = Hand.new(play_draw, player1_card).score << 'player1'
player2_card_score = Hand.new(play_draw, player2_card).score << 'player2'

players_score = []
players_score << player1_card_score
players_score << player2_card_score

winner = Winner.new(players_score).winner

print "Winn #{winner[1..winner.size - 1]} with combine #{winner[0]}"
