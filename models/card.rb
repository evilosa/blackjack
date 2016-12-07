# Class store card info
class Card
  PICTURE_CARDS = %w(J Q K).freeze
  ACE = 'A'.freeze

  attr_reader :type, :suit
  attr_accessor :hidden

  def initialize(type, suit)
    @type = type
    @suit = suit
    @hidden = false
  end

  def score
    return 11 if type == ACE
    return 10 if PICTURE_CARDS.include? type
    type.to_f
  end

  def type_to_s
    return ' ' + type if type.to_s.length == 1
    type
  end

  def suit_to_s
    case suit
    when :diamonds
      "\u2666"
    when :spades
      "\u2660"
    when :clubs
      "\u2663"
    when :hearts
      "\u2665"
    end
  end

  def to_s
    "#{type} #{suit}"
  end
end
