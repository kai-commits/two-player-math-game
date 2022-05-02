class Player
  def initialize(name, lives = 3)
    @name = name
    @lives = lives
  end

  def lose_life
    @lives -= 1
  end

  attr_reader :lives
  attr_reader :name
end