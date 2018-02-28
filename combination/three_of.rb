require_relative 'combinations'
# Class for find combination three of a kind
class ThreeOf < Combinations
  def check?
    x_of_a_kind?(3)
  end
end
