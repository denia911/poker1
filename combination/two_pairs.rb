require_relative 'combinations'
# Class for find combination two pairs
class TwoPairs < Combinations
  def check?
    @values.each do |value|
      return true if (first_pair.select { |card| card == value }).size == 2
    end
    false
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
end
