require_relative '../modules/balance'

# Main class for player logic
class Player
  include Balance

  attr_reader :score

  def initialize
    @score = 0
    @balance = 100
  end
end
