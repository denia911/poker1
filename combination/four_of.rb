require_relative 'combinations'
# Class for find combination four of a kind
class FourOf < Combinations
  def check?
    x_of_a_kind?(4)
  end

  def kicker
    kicker_x_of_a_kind(4)
  end
end
