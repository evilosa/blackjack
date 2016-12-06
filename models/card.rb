# Class store card info
class Card
  attr_reader :type, :suit

  def initialize(type, suit)
    @type = type
    @suit = suit
  end
end
