require_relative 'combinations'
# Class for find combination straight flush
class StraightFlush < Combinations
  def check?
    if flush_suit('h') then values = straight_flash_values('h')
    elsif flush_suit('c') then values = straight_flash_values('c')
    elsif flush_suit('s') then values = straight_flash_values('s')
    elsif flush_suit('d') then values = straight_flash_values('d')
    else
      return false
    end
    straight_find?(values)
  end
end
