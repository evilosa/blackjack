require_relative 'player'

# User class
class User < Player
  attr_reader :name

  def initalize(name)
    @name = name
  end
end
