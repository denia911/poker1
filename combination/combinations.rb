# Parrent class for find combinations
class Combinations
  def initialize(draw, hand)
    @cards = draw + hand
    @values = (1..14).to_a
    @cards = card_values
  end

  def x_of_a_kind?(quantity)
    values = @cards.map { |card| card[0] }
    @values.each do |value|
      return true if (values.select { |card| card == value }).size == quantity
    end
    false
  end

  def card_values
    @cards.map do |card|
      card[0] = case card[0]
                when 'J' then 11
                when 'Q' then 12
                when 'K' then 13
                when 'A' then 14
                else card[0]
                end
      card
    end
  end

  def flush_suit(suit)
    suits = @cards.map { |card| card[1] }
    suits.find_all { |card| card == suit }.size >= 5
  end

  def straight_flash_values(suit)
    values = @cards.map do |card|
      card[0] if card[1] == suit
    end
    values.compact.uniq.sort.reverse
  end

  def straight_find?(values)
    3.times do |card|
      return true if values[card..card + 4] ==
                     (values[card] - 4..values[card]).to_a.reverse
    end
    false
  end
end
