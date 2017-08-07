class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each_with_index do |color, i|
      puts "#{i + 1} - #{color}"
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "What was the sequence?"
    print ">"
    guess = gets.chomp.split(" ")
    @game_over = true if guess != @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Good job!"
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if $PROGRAM_NAME == __FILE__
  game = Simon.new
  end_game = false
  until end_game
    system("clear")
    game.play
    puts "Do you give up? (y/n)"
    print ">"
    input = gets.chomp.downcase
    end_game = true if input == "y"
  end
end
