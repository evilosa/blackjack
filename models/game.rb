require_relative 'dealer'
require_relative 'deck'
require_relative 'user'

# Class for current game state
class Game
  attr_reader :dealer, :user, :deck

  def initialize
    @deck = Deck.new
  end
end
