require 'yaml'

MESSAGES = YAML.load_file('ttt.yml')


class TTTGame
  attr_reader :human, :computer, :board

  def initialize
    @board = Board.new
  end

  def play
    display_welcome_message
    add_players
    until winner? || cat?
      x_turn
      o_turn
    end
    display_winner
    play_again?
  end

  def display_welcome_message
    puts MESSAGES['welcome']
  end

  def add_players
    @human = Human.new
    @computer = Computer.new
  end

  def winner

  end


end


class Player
  @@last_marker_chosen = nil
end


class Computer < Player
  def initialize
    @marker_choice = select_marker
    @@last_marker_chosen = nil
  end

  def select_marker
    @@last_marker_chosen == 'X' ? 'O' : 'X'
  end
end


class Human < Player
  def initialize
    @marker_choice = select_marker
    @@last_marker_chosen = @marker_choice
  end

  def place_marker

  end

  private

  def select_marker
    choice = nil
    loop do
      puts MESSAGES['request_player_input']
      choice = gets.chomp.upcase
      break if valid_marker?(choice)
      puts MESSAGES['invalid_player_input']
    end
    @marker_choice = choice
  end

  def valid_marker?(choice)
    ['X','O'].include?(choice)
  end
end


class Board
  attr_accessor :spaces

  LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
         [0, 4, 8], [2, 4, 6]]

  def initialize
    @spaces = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @lines = current_lines
  end

  def current_lines
    LINES.map do |line|
      line.map { |index| spaces[index] }
    end
  end

  def to_s
    puts <<-BOARD
            |         |
        #{spaces[0]}   |    #{spaces[1]}    |    #{spaces[2]}
            |         |
    ----------------------------
            |         |
        #{spaces[3]}   |    #{spaces[4]}    |    #{spaces[5]}
            |         |
    ----------------------------
            |         |
        #{spaces[6]}   |    #{spaces[7]}    |    #{spaces[8]}
            |         |
    BOARD
  end
end


class Marker
  attr_reader :type

  def initialize(type)
    @type = type
  end
end

Board.new.to_s
