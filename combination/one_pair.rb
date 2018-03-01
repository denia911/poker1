require_relative 'combinations'
# Class for find combination one pair
class OnePair < Combinations
  def check?
    x_of_a_kind?(2)
  end

  def kicker
    kicker_x_of_a_kind(2)
  end
end
