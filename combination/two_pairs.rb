require_relative 'combinations'
# Class for find combination two pairs
class TwoPairs < Combinations
  def check?
    @values.each do |value|
      return true if (first_pair.select { |card| card == value }).size == 2
    end
    false
  end

  def kicker
    kicker = if kicker_x_of_a_kind(2)[0] > kicker_x_of_a_kind_second[0]
               kicker_x_of_a_kind(2)
             else
               kicker_x_of_a_kind_second
             end
    kicker
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

  def kicker_x_of_a_kind_second
    @values.each do |value|
      if (first_pair.select { |card| card == value }).size == 2
        return @cards.find { |el| el[0] == value }
      end
    end
  end
end
