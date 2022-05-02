class Game
  def initialize(player1, player2, rounds = 1)
    @player1 = player1
    @player2 = player2
    @rounds = rounds
  end

  def question(player)
    value1 = rand(1..20)
    value2 = rand(1..20)
    puts "#{player.name}: What does #{value1} plus #{value2} equal?"
    answer = value1 + value2
  end

  def winner
    winner = @player1.lives > 0 ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/#{winner.total_lives}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def answer(player, input, correct)
    if input == correct
      puts "#{player.name}: YES! You are correct."
    else
      puts "#{player.name}: Seriously? No!"
      player.lose_life
    end
  end

  def end_round
    @rounds += 1
    puts "#{@player1.name} lives: #{@player1.lives}/#{@player1.total_lives}" +
    " vs #{@player2.name} lives: #{@player2.lives}/#{@player2.total_lives}"
    puts "----- NEW TURN -----"
  end

  def play
    while @player1.lives > 0 && @player2.lives > 0
      current_player = @rounds.even? ? @player2 : @player1
      current_question = question(current_player)
      input = $stdin.gets.chomp.to_i
      answer(current_player, input, current_question)
      end_round
    end
    winner
  end
end
