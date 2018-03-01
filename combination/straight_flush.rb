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

  def kicker
    if flush_suit('h') then values = straight_flash_values('h')
    elsif flush_suit('c') then values = straight_flash_values('c')
    elsif flush_suit('s') then values = straight_flash_values('s')
    elsif flush_suit('d') then values = straight_flash_values('d')
    end
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
