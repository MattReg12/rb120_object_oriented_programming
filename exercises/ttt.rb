require 'yaml'

MESSAGES = YAML.load_file('ttt.yml')

class TTTGame
  attr_reader :human, :x_player, :o_player

  def initialize
    @board = Board.new
  end

  def play
    display_welcome_message
    add_players
    until winner? || board.full?
      turn(x_player)
      turn(o_player)
    end
    display_winner
    play_again?
  end

  private

  def display_welcome_message
    puts MESSAGES['welcome']
  end

  def add_players
    human = Human.new
    computer = Computer.new
    if human.marker_choice == 'X'
      @x_player, @o_player - human, computer
    else
      @x_player, @o_player - computer, human
    end
  end

  def winner?
    board.current_lines.any? do |line|
      ['XXX', 'OOO'].include?(line.join)
    end
  end

  def turn(player)
    board.display
    board.receive(player.selection)
    player.choice_commentary
  end
end


class Player
  attr_reader :marker_choice

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

  def selection
    prompt(MESSAGES['space_selection'])
    gets.chomp.to_i
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

  def valid_space?(space, board_spaces)
    board_spaces[space].is_a?(Integer)
  end
end


class Board
  attr_accessor :spaces
  attr_reader :lines

  LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
         [0, 4, 8], [2, 4, 6]]

  def initialize
    @spaces = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @lines = current_lines
  end

  def current_lines
    @lines = LINES.map do |line|
      line.map { |index| spaces[index] }
    end
  end

  def full?
    spaces.none? { |space| space.is_a?(Integer) }
  end

  def display
    puts "\n\nThe current state of the board is: \n\n\n"
    puts to_s + "\n\n\n"
  end

  def to_s
    <<-BOARD
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

Board.new.display
