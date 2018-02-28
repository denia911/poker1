require_relative 'combinations'
# Class for find combination flush
class Flush < Combinations
  def check?
    if flush_suit('h') || flush_suit('c') || flush_suit('s') || flush_suit('d')
      return true
    end
    false
  end
end
