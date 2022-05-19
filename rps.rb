require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    if rock?
      other_move.scissors?
    elsif paper?
      other_move.rock?
    else other_move.paper?
    end
  end

  def <(other_move)
    if rock?
      other_move.paper?
    elsif paper?
      other_move.scissors?
    else
      other_move.rock?
    end
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "Whats your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    @name = n
  end

  def choose
    choice = nil
    loop do
      puts MESSAGES['player_choice_prompt']
      choice = gets.chomp
      break if valid_choice?(choice)
      puts MESSAGES['player_choice_error_message']
    end
    self.move = Move.new(choice)
  end

  def valid_choice?(choice)
    ['rock', 'paper', 'scissors'].include?(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Melvin', 'Richard', 'Beatrix', 'Fargo'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors!'
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    case winner
    when human then puts "#{human.name} won!"
    when computer then puts "#{computer.name} won!"
    else puts "It's a tie!"
    end
  end

  def winner
    if human.move > computer.move
      human
    elsif human.move < computer.move
      computer
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
