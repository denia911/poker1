require_relative 'combinations'
# Class for find combination royal flush
class RoyalFlush < Combinations
  def check?
    if flush_suit('h') then values = straight_flash_values('h')
    elsif flush_suit('c') then values = straight_flash_values('c')
    elsif flush_suit('s') then values = straight_flash_values('s')
    elsif flush_suit('d') then values = straight_flash_values('d')
    else
      return false
    end
    return true if values[0..4] == [14, 13, 12, 11, 10]
    false
  end
end
