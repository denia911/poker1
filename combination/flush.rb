require_relative 'combinations'
# Class for find combination flush
class Flush < Combinations
  def check?
    if flush_suit('h') || flush_suit('c') || flush_suit('s') || flush_suit('d')
      return true
    end
    false
  end

  def kicker
    if flush_suit('h') then values = straight_flash_values('h')
    elsif flush_suit('c') then values = straight_flash_values('c')
    elsif flush_suit('s') then values = straight_flash_values('s')
    elsif flush_suit('d') then values = straight_flash_values('d')
    end
    @cards.find { |el| el[0] == values[0] }
  end
end
