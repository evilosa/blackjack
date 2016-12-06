require_relative 'dealer'
require_relative 'deck'
require_relative 'user'

# Class for current game state
class Game
  attr_reader :dealer, :user

  def initialize
    @user = User.new
    @dealer = Dealer.new
  end

  def new_round
    @deck = Deck.new
    @deck.shuffle
  end

  private

  attr_reader :deck
end
