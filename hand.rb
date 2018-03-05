require_relative 'combination/one_pair'
require_relative 'combination/two_pairs'
require_relative 'combination/three_of'
require_relative 'combination/straight'
require_relative 'combination/flush'
require_relative 'combination/four_of'
require_relative 'combination/full_house'
require_relative 'combination/royal_flush'
require_relative 'combination/straight_flush'
# Class for estimate combinations
class Hand
  include Comparable
  attr_accessor :combination
  def <=>(other)
    combination_scores = { 'high card' => 1, 'one pair' => 2, 'two pairs' => 3,
                           'three of a kind' => 4, 'straight' => 5,
                           'flush' => 6, 'full house' => 7,
                           'four of a kind' => 8, 'straight flush' => 9,
                           'royal flush' => 10 }
    combination_scores[combination] <=> combination_scores[other.combination]
  end

  def initialize(draw, hand)
    @draw = draw
    @hand = hand
    check
  end

  def check
    if RoyalFlush.new(@draw, @hand).check?
      self.combination = 'royal flush'
    elsif StraightFlush.new(@draw, @hand).check?
      @kicker = StraightFlush.new(@draw, @hand).kicker
      self.combination = 'straight flush'
    elsif FourOf.new(@draw, @hand).check?
      @kicker = FourOf.new(@draw, @hand).kicker
      self.combination = 'four of a kind'
    elsif FullHouse.new(@draw, @hand).check?
      @kicker = FullHouse.new(@draw, @hand).kicker
      self.combination = 'full house'
    elsif Flush.new(@draw, @hand).check?
      @kicker = Flush.new(@draw, @hand).kicker
      self.combination = 'flush'
    elsif Straight.new(@draw, @hand).check?
      @kicker = Straight.new(@draw, @hand).kicker
      self.combination = 'straight'
    elsif ThreeOf.new(@draw, @hand).check?
      @kicker = ThreeOf.new(@draw, @hand).kicker
      self.combination = 'three of a kind'
    elsif TwoPairs.new(@draw, @hand).check?
      @kicker = TwoPairs.new(@draw, @hand).kicker
      self.combination = 'two pairs'
    elsif OnePair.new(@draw, @hand).check?
      @kicker = OnePair.new(@draw, @hand).kicker
      self.combination = 'one pair'
    else
      @kicker = Combinations.new(@draw, @hand).kicker_high_card
      self.combination = 'high card'
    end
  end

  attr_reader :kicker
end
