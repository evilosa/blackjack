require_relative '../modules/balance'

# Main class for player logic
class Player
  include Balance

  attr_reader :score, :cards
  attr_accessor :name

  def initialize
    @score = 0
    @cards = []
    @balance = 100
    @name = 'Dealer'
  end

  def new_round
    self.cards = []
    @score = 0
  end

  def take_card(deck, count = 1)
    count.times { cards << deck.take_card }
    calculate_score
  end
  
  private

  attr_writer :cards

  def calculate_score
    @score = 0
    cards.each do |card|
      @score += if card.score != 11 # It's not ace, just add it
                  card.score
                else
                  score >= 11 ? 1 : 11 # It's ace, if score more than 11 then 1, else 11
                end
    end
  end
end
