class Game
  def initialize(player1, player2, rounds = 1)
    @player1 = player1
    @player2 = player2
    @rounds = rounds
  end

  def question
    value1 = rand(1..20)
    value2 = rand(1..20)
    answer = value1 + value2
    {value1:, value2:, answer:}
  end

  def winner
    winner = @player1.lives > 0 ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def play
    while @player1.lives > 0 && @player2.lives > 0
      current_player = @rounds.even? ? @player2 : @player1
      current_question = question
      puts "#{current_player.name}: What does #{current_question[:value1]} plus #{current_question[:value2]} equal?"
      answer = $stdin.gets.chomp
      if answer.to_i == current_question[:answer]
        puts "YES! You are correct."
      else 
        puts "#{current_player.name}: Seriously? No!"
        current_player.lose_life
      end
      @rounds += 1
      puts "#{@player1.name} lives: #{@player1.lives}/3 vs #{@player2.name} lives: #{@player2.lives}/3"
      puts "----- NEW TURN -----"
    end
    winner
  end
end
