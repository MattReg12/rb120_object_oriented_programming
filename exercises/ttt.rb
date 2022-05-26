require 'yaml'

MESSAGES = YAML.load_file('ttt.yml')

class TTTGame
  attr_reader :human, :x_player, :o_player, :board

  def initialize
    @board = Board.new
  end

  def play
    display_welcome_message
    sleep(3)
    add_players
    until game_over?
      turn(x_player)
      sleep(3)
      break if game_over?
      turn(o_player)
      sleep(3)
      system("clear")
    end
    display_winner
    #play_again?
  end

  private

  def game_over?
    winner? || board.full?
  end

  def display_welcome_message
    puts MESSAGES['welcome']
  end

  def display_board
    board.display
  end

  def display_winner
    puts winner.nil? ? MESSAGES['cat'] : MESSAGES['winner'] % winner.name
  end

  def add_players
    human = Human.new(board)
    computer = Computer.new(board)
    if human.marker == 'X'
      @x_player, @o_player = human, computer
    else
      @x_player, @o_player = computer, human
    end
  end

  def winner
    win_line = board.current_lines.find { |line| ['XXX', 'OOO'].include?(line.join) }
    case win_line.join
    when 'XXX' then x_player
    when 'OOO' then o_player
    end
  end

  def winner?
    board.current_lines.any? do |line|
      ['XXX', 'OOO'].include?(line.join)
    end
  end

  def turn(player)
    display_board
    selection = player.select_space
    loop do
      puts MESSAGES['turn_commentary'] % [player.name, player.marker, selection]
      sleep(3)
      break if board.open_space?(selection)
      puts MESSAGES['space_selection_error']
      display_board
      selection = player.select_space
    end
    board.receive(selection, player.marker)
  end
end


class Player
  attr_reader :marker, :board, :name

  @@last_marker_chosen = nil

  def initialize(board)
    @board = board
    @marker = select_marker
    @name = select_name
  end

  private

  def select_name
    puts 'Please enter your name: '
    answer = gets.chomp
    answer == '' ? 'Blanky' : answer
  end

  def valid_space?(space, board_spaces)
    board_spaces[space].is_a?(Integer)
  end
end


class Computer < Player
  def initialize(board)
    super(board)
    @@last_marker_chosen = nil
  end

  def select_space
    board.open_spaces.sample
  end

  def select_name
    ['Beatrix', 'Ignatius', 'Reilly', 'Mckayla', 'Jaden', 'Santa', 'Mancuso'].sample
  end

  def select_marker
    @@last_marker_chosen == 'X' ? 'O' : 'X'
  end
end

class Human < Player
  def initialize(board)
    super(board)
    @@last_marker_chosen = @marker
  end

  def select_space
    puts MESSAGES['space_selection']
    gets.chomp
  end

  def select_marker
    choice = nil
    loop do
      puts MESSAGES['request_player_input']
      choice = gets.chomp.upcase
      break if valid_marker?(choice)
      puts MESSAGES['invalid_player_input']
    end
    @marker = choice
  end

  private

  def valid_marker?(choice)
    ['X', 'O'].include?(choice)
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

  def receive(selection, marker)
    spaces[selection.to_i] = marker
  end

  def current_lines
    @lines = LINES.map do |line|
      line.map { |index| spaces[index] }
    end
  end

  def open_spaces
    spaces.select { |space| space.is_a?(Integer) }
  end

  def open_space?(selection)
    return false if selection.to_i.to_s != selection.to_s

    open_spaces.include?(selection.to_i)
  end

  def full?
    open_spaces.empty?
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

TTTGame.new.play
