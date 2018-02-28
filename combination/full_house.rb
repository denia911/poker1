require_relative 'combinations'
# Class for find combination full house
class FullHouse < Combinations
  def check?
    x_of_a_kind?(2) && x_of_a_kind?(3)
  end
end
