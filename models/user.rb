require_relative 'player'

# User class
class User < Player
  attr_accessor :name

  def initalize(name)
    @name = name
  end
end
