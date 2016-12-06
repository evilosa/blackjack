require_relative 'models/deck'
require_relative 'models/game'

game = Game.new
game.user.name = 'Aleksandr'
game.new_round

deck = Deck.new
deck.shuffle
puts deck.cards
