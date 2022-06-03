require 'yaml'
MESSAGES = YAML.load_file('twenty_one.yml')

class TwentyOneGame
  attr_reader :player, :dealer, :deck, :bet

  def initialize
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    display_welcome
    loop do
      start_game
      player_turn
      dealer_turn unless busted?(player)
      process_bets
      display_winner
      break if end_game?
    end
    display_farewell
  end

  private

  # housekeeping functions
  def start_game
    clear_screen
    @deck = Deck.new
    @bet = 0
    player.discard_hand
    dealer.discard_hand
    deal_opening_cards
  end

  def end_game?
    player.broke? || !play_again?
  end

  def deal_opening_cards
    2.times { deal_card_to(player) }
    2.times { deal_card_to(dealer) }
  end

  def deal_card_to(participant)
    participant.hand << deck.deal
  end

  def player_turn
    take_bet
    dealer.display_pre_hand
    player.display_hand
    resolve_player_choices
  end

  def dealer_turn
    dealer.display_hand
    resolve_dealer_choices
  end

  def resolve_player_choices
    until player.choice == 'stay'
      deal_card_to(player)
      display_dealt_card
      pause
      player.display_hand
      break if busted?(player)
    end
  end

  def resolve_dealer_choices
    until dealer.hand_value >= 17
      deal_card_to(dealer)
      puts format(MESSAGES['dealer_hit'], dealer.hand.last, dealer.hand_value)
      pause
      return if busted?(dealer)
    end
    puts MESSAGES['dealer_stay']
  end

  def busted?(participant)
    participant.hand_value > 21
  end

  def take_bet
    @bet = player.bet
  end

  def winner
    if busted?(player)
      dealer
    elsif busted?(dealer)
      player
    elsif dealer.hand_value == player.hand_value
      nil
    else
      [player, dealer].max_by(&:hand_value)
    end
  end

  def display_welcome
    puts MESSAGES['welcome']
    pause
  end

  def display_winner
    case winner
    when nil then puts MESSAGES['push']
    when player then puts format(MESSAGES['player_win'], bet, player.cash)
    else puts format(MESSAGES['dealer_win'], bet, player.cash)
    end
  end

  def display_dealt_card
    puts format(MESSAGES['dealt_card'], player.hand.last)
  end

  def display_farewell
    puts MESSAGES['farewell']
  end

  def process_bets
    case winner
    when player then player.cash += bet
    when dealer then player.cash -= bet
    end
  end

  def play_again?
    puts MESSAGES['play_again_prompt']
    answer = gets.chomp.downcase
    ['y', 'yes'].include?(answer)
  end

  def clear_screen
    system('clear')
  end

  def pause
    sleep(3)
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = add_cards.shuffle
  end

  def deal
    @cards.pop
  end

  private

  def add_cards
    Card::SUITS.each_with_object([]) do |suit, deck|
      Card::NAME_VALUES.each do |name, _|
        deck << Card.new(name, suit)
      end
    end
  end
end

class Card
  attr_reader :value, :name

  SUITS =       [' of Hearts', ' of Clubs', ' of Diamonds', ' of Spades']
  NAME_VALUES = { 'Ace' => 11, 'Two' => 2, 'Three' => 3,
                  'Four' => 4, 'Five' => 5, 'Six' => 6, 'Seven' => 7,
                  'Eight' => 8, 'Nine' => 9, 'Ten' => 10, 'Jack' => 10,
                  'Queen' => 10, 'King' => 10 }

  def initialize(name, suit)
    @name = name + suit
    @value = NAME_VALUES[name]
  end

  def to_s
    name
  end
end

#implementing classes must have a instance variable @hand as an array
module TwentyOneHand
  attr_accessor :hand

  def hand_value
    total = hand.reduce(0) { |sum, card| sum + card.value }
    @hand_value = ace_handler(ace_count(hand), total)
  end

  def ace_count(hand)
    hand.count { |card| card.name.include?('Ace') }
  end

  def ace_handler(ace_count, total)
    ace_count.times do
      break if total <= 21
      total -= 10
    end
    total
  end

  def discard_hand
    @hand = []
  end

  def display_hand
    puts format(MESSAGES['display'], self, hand.join(' and the '), hand_value)
  end
end

class Dealer
  include TwentyOneHand

  def initialize
    @hand = []
  end

  def display_pre_hand
    shown_card = hand.last
    puts format(MESSAGES['dealer_pre_hand'], shown_card, shown_card.value)
  end

  def to_s
    'Dealer'
  end
end

class Player
  include TwentyOneHand

  attr_accessor :cash

  def initialize
    @cash = rand(100..1000)
    @hand = []
  end

  def broke?
    @cash.zero?
  end

  def choice
    loop do
      puts MESSAGES['turn_prompt']
      decision = gets.chomp.downcase
      return decision if valid_choice?(decision)
      puts MESSAGES['choice_error']
    end
  end

  def bet
    loop do
      puts format(MESSAGES['cash_on_hand'], cash)
      puts MESSAGES['bet_prompt']
      bet = gets.chomp
      return bet.to_i if valid_bet?(bet)
      puts format(MESSAGES['bet_error'], cash)
    end
  end

  def to_s
    'Player'
  end

  private

  def valid_bet?(bet)
    int_bet = bet.to_i
    return false if int_bet.to_s != bet

    int_bet.between?(1, cash)
  end

  def valid_choice?(choice)
    ['hit', 'stay'].include?(choice)
  end
end

TwentyOneGame.new.play
