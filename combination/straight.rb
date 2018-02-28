require_relative 'combinations'
# Class for find combination staight
class Straight < Combinations
  def check?
    values = @cards.map { |card| card[0] }
    values = values.uniq.sort.reverse
    straight_find?(values)
  end
end
