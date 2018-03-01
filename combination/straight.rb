require_relative 'combinations'
# Class for find combination staight
class Straight < Combinations
  def check?
    values = @cards.map { |card| card[0] }
    values = values.uniq.sort.reverse
    straight_find?(values)
  end

  def kicker
    values = @cards.map { |card| card[0] }
    values = values.uniq.sort.reverse
    kicker_search(values)
  end

  private

  def kicker_search(values)
    3.times do |card|
      if values[card..card + 4] == (values[card] - 4..values[card]).to_a.reverse
        return @cards.find { |el| el[0] == values[card] }
      end
    end
  end
end
