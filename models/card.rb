# Class store card info
class Card
  attr_reader :type, :suit
  attr_accessor :hidden

  def initialize(type, suit)
    @type = type
    @suit = suit
    @hidden = false
  end

  def to_s
    "#{type} #{suit}"
  end
end
