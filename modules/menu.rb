# Main menu module
module Menu
  def self.print_header(header = 'Main menu')
    print_line
    puts '---------------------- SORC: Black jack game ------------------------'
    print_line
    puts header
    puts
  end

  def self.print_line
    puts '---------------------------------------------------------------------'
  end

  def self.clear_screen
    system('clear')
  end
end
