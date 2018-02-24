# Class for find combinations and their estimates
class Hand
  def initialize(draw, hand)
    @cards = draw + hand
    @values = (1..14).to_a
    @cards = card_values
  end

  def score
    score = if royal_flush? then [10, 'royal flush']
            elsif straight_flush? then [9, 'straight flush']
            elsif four_of_a_kind? then [8, 'four of a kind']
            elsif full_house? then [7, 'full house']
            elsif flush? then [6, 'flush']
            elsif straight? then [5, 'straight']
            elsif three_of_a_kind? then [4, 'three of a kind']
            elsif two_pairs? then [3, 'two pairs']
            elsif one_pair? then [2, 'one pair']
            else  [1, 'high card']
            end
    score
  end

  def royal_flush?
    if flush_suit('h') then values = straight_flash_values('h')
    elsif flush_suit('c') then values = straight_flash_values('c')
    elsif flush_suit('s') then values = straight_flash_values('s')
    elsif flush_suit('d') then values = straight_flash_values('d')
    else
      return false
    end
    return true if values[0..4] == [14, 13, 12, 11, 10]
    false
  end

  def straight_flush?
    if flush_suit('h') then values = straight_flash_values('h')
    elsif flush_suit('c') then values = straight_flash_values('c')
    elsif flush_suit('s') then values = straight_flash_values('s')
    elsif flush_suit('d') then values = straight_flash_values('d')
    else
      return false
    end
    straight_find?(values)
  end

  def four_of_a_kind?
    x_of_a_kind?(4)
  end

  def x_of_a_kind?(quantity)
    values = @cards.map { |card| card[0] }
    @values.each do |value|
      return true if (values.select { |card| card == value }).size == quantity
    end
    false
  end

  def full_house?
    x_of_a_kind?(2) && x_of_a_kind?(3)
  end

  def flush?
    if flush_suit('h') || flush_suit('c') || flush_suit('s') || flush_suit('d')
      return true
    end
    false
  end

  def straight?
    values = @cards.map { |card| card[0] }
    values = values.uniq.sort.reverse
    straight_find?(values)
  end

  def three_of_a_kind?
    x_of_a_kind?(3)
  end

  def two_pairs?
    @values.each do |value|
      return true if (first_pair.select { |card| card == value }).size == 2
    end
    false
  end

  def one_pair?
    x_of_a_kind?(2)
  end

  private

  def first_pair
    values = @cards.map { |card| card[0] }
    @values.each do |value|
      if (remaining_values = values.select { |card| card == value }).size == 2
        return values -= remaining_values
      else
        false
      end
    end
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
