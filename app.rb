require_relative 'card_deck'
require_relative 'hand'
require_relative 'crupier'

card_deck = CardDeck.new.mix_deck
play_draw = Crupier.new(card_deck).draw
puts "Cards on table #{play_draw}"
player1_card = Crupier.new(CardDeck.new.mix_deck).hand
puts "Players 1 cards #{player1_card}"
player2_card = Crupier.new(CardDeck.new.mix_deck).hand
puts "Players 2 cards #{player2_card}"

player1 = Hand.new(play_draw, player1_card)
player2 = Hand.new(play_draw, player2_card)

if player1 > player2
  print "Winn player1 with combine #{player1.combination}"
elsif player1 < player2
  print "Winn player2 with combine #{player2.combination}"
else
  if player1.kicker[0] > player2.kicker[0]
    print "Winn player1 with combine #{player1.combination}"
  elsif player1.kicker[0] < player2.kicker[0]
    print "Winn player2 with combine #{player2.combination}"
  else
    print "Winn both players with combine #{player2.combination}"
  end
end
