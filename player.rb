class Player
  def initialize(name, lives = 3, total_lives = 3)
    @name = name
    @lives = lives
    @total_lives = total_lives
  end

  def lose_life
    @lives -= 1
  end

  attr_reader :lives
  attr_reader :name
  attr_reader :total_lives
end