# Display module show game data to screen
module Display
  class << self
    def print_header(header = 'Main menu')
      print_line
      puts '---------------------- SORC: Black jack game ----------------------'
      print_line
      puts header
      puts '---------'
    end

    def print_line
      puts '-------------------------------------------------------------------'
    end

    def print_cards(player, hidden = false)
      puts "Player (#{player.balance} $): #{player.name} - score #{hidden ? '?' : player.score}"
      puts '---------'
      lines = if hidden
                create_hidden_cards_strings_array(player.cards)
              else
                create_cards_strings_array(player.cards)
              end
      puts lines
    end

    def clear_screen
      system('clear')
    end

    def print_greatings
      clear_screen
      print_header('You are welcome!')
      puts 'Input your name, please:'
    end

    def print_main_menu
      clear_screen
      print_header('Main menu')
      puts '1. New game'
      puts '2. Add 100 $ to balance'
      puts '3. Exit'
    end

    def print_game_menu
      puts '1. Skip'
      puts '2. Take card'
      puts '3. Open cards'
      puts '4. Exit'
    end

    private

    def create_cards_strings_array(cards)
      lines = ['', '', '', '', '']
      cards.each do |card|
        lines[0] += '********   '
        lines[1] += "*   #{card.type_to_s} *   "
        lines[2] += "*  #{card.suit_to_s}   *   "
        lines[3] += "*#{card.type_to_s}    *   "
        lines[4] += '********   '
      end
      lines
    end

    def create_hidden_cards_strings_array(cards)
      lines = ['', '', '', '', '']
      cards.each do
        lines[0] += '********   '
        lines[1] += '********   '
        lines[2] += '********   '
        lines[3] += '********   '
        lines[4] += '********   '
      end
      lines
    end
  end
end
