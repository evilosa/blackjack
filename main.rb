require_relative 'models/deck'
require_relative 'models/game'
require_relative 'modules/display'

Display.print_greatings
user_name = gets.chomp.to_s
# user_name = 'Aleksandr'

game = Game.new
game.user.name = user_name

loop do
  begin
    Display.print_main_menu

    input = gets.chomp.to_s
    raise 'Incorrect input' if input !~ /^\d{1}\z/

    menu_index = input.to_i
    raise 'Index out of range' unless (1..3).cover? menu_index

    # Если мы здесь значит пользователь ввел корректный номер меню
    case menu_index
    when 1
      game.new_round
    when 2
      game.user.add_balance(100)
    when 3
      puts 'Thank you for using our game. Good bye!'
      break
    end
  rescue => exception
    retry if exception.message == 'Incorrect input'
    retry if exception.message == 'Index out of range'
  end
end
