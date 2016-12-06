require_relative 'player'
require_relative 'deck'
require_relative '../modules/display'

# Class for current game state
class Game
  BET = 10

  attr_reader :dealer, :cards_hidden, :user, :bank, :winner

  def initialize
    @user = Player.new
    @dealer = Player.new
    @cards_hidden = true
  end

  def new_round
    reset_state

    dealer_take_card(2)
    user_take_card(2)

    dealer.reduce_balance(BET)
    user.reduce_balance(BET)

    @bank = BET * 2

    loop do
      begin
        find_winner if user.cards.size == 3

        if winner != '' # end of game
          @cards_hidden = false
          display
          puts winner
          puts 'Press Enter to continue'
          input = gets.chomp.to_s
          reset_state
          break
        end

        display
        Display.print_game_menu

        input = gets.chomp.to_s
        raise 'Incorrect input' if input !~ /^\d{1}\z/

        menu_index = input.to_i
        raise 'Index out of range' unless (1..4).cover? menu_index

        # If we there, than user input correct index, and game not end
        case menu_index
        when 1
          skip
        when 2
          user_take_card
          skip
        when 3
          open_cards
        when 4
          break
        end
      rescue => exception
        retry if exception.message == 'Incorrect input'
        retry if exception.message == 'Index out of range'
      end
    end
  end

  def skip
    dealer_take_card if dealer.cards.size < 3
  end

  def dealer_take_card(count = 1)
    dealer.take_card(deck, count)
  end

  def user_take_card(count = 1)
    user.take_card(deck, count)
  end

  def open_cards
    @cards_hidden = false
    find_winner
  end

  def display
    Display.clear_screen
    Display.print_header("Game: bank #{bank}")
    Display.print_cards(dealer, @cards_hidden)
    Display.print_cards(user)
  end

  def find_winner
    if user.score == 21
      user_win
    elsif dealer.score == 21
      dealer_win
    elsif user.score < 21 && dealer.score < 21
      user_win if dealer.score < user.score
      dealer_win if user.score < dealer.score
    elsif user.score > 21 && dealer.score < 21
      dealer_win
    elsif dealer.score > 21 && user.score < 21
      user_win
    else
      money_back
    end
  end

  private

  attr_reader :deck

  def reset_state
    @deck = Deck.new
    @deck.shuffle
    @bank = 0
    @dealer.new_round
    @user.new_round
    @cards_hidden = true
    @winner = ''
  end

  def user_win
    user.add_balance(bank)
    @winner = 'Congratulation, you win'
  end

  def dealer_win
    dealer.add_balance(bank)
    @winner = 'Sorry, dealer win'
  end

  def money_back
    dealer.add_balance(BET)
    user.add_balance(BET)
    @winner = 'No winner'
  end
end
