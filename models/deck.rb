# Class for store deck state
class Deck
  attr_reader :cards

  CARDS_TYPES = [2..10, 'J', 'Q', 'K', 'A'].freeze
  CARDS_SUITS = [:diamonds, :spades, :clubs, :hearts].freeze

  def initialize
    @cards = []
    CARDS_TYPES.each do |type|
      CARDS_SUITS.each { |suit| @cards << Card.new(type, suit) }
    end
  end
end
