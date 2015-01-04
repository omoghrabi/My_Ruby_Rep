module Cards 
  attr_accessor :card_deck2
  def card_selection(card_deck2)
    card_deck2.keys.sample
  end 

  def card_face_value(card_deck2, card)
    card_deck2[card]
  end 
end 

class Player 
  include Cards
  attr_accessor :player_hand, :player_hand_value, :selection, :deck_one
  def initialize(deck)
    @deck_one = deck 
    @player_hand = []
    @player_hand_value = 0
    @selection = ""
  end 

  def player_initial_cards
    2.times{self.player_hand << card_selection(deck_one)}
    "your hand is #{player_hand}"
  end 

  def player_total_value
    player_hand.each{|each_card| self.player_hand_value = player_hand_value + card_face_value(deck_one, each_card)}
    "your hand's total value is #{player_hand_value}"
  end 

  def player_hit_card
    player_choice
    while player_hand_value < 21 && selection == "hit"
    self.player_hand << card_selection(deck_one)
    self.player_hand_value = player_hand_value + card_face_value(deck_one, player_hand.last)
    check_for_ace
    puts "your hand is #{player_hand}"
    puts "your hand's total value is #{player_hand_value}"
    if player_hand_value > 21
      break
    end 
    player_choice
    end 
  end 

  def check_for_ace 
    if player_hand.include?("Ace") && player_hand_value > 21 
      self.player_hand_value = player_hand_value - 10
    end 
  end 

  def player_choice
    puts "Do you want to hit or stay"
    self.selection = gets.chomp.downcase 
    check_player_input 
  end 
  def check_player_input
    while selection != "hit" && selection != "stay"
      puts "Please enter a valid input"
      self.selection = gets.chomp.downcase
    end 
  end 
end 

class Dealer 
  include Cards
  attr_accessor :dealer_hand, :dealer_hand_value, :deck_one
  def initialize(deck)
    @deck_one = deck
    @dealer_hand = []
    @dealer_hand_value = 0
  end 

  def dealer_initial_cards
    2.times{self.dealer_hand << card_selection(deck_one)}
    "Dealer's hand is #{dealer_hand}"
  end 

  def dealer_total_value
    dealer_hand.select{|each_card| self.dealer_hand_value = dealer_hand_value + card_face_value(deck_one, each_card)}
    "dealer's hand total value is #{dealer_hand_value}"
  end 

  def dealer_hit_card
    while dealer_hand_value < 17
    self.dealer_hand << card_selection(deck_one)
    self.dealer_hand_value = dealer_hand_value + card_face_value(deck_one, dealer_hand.last)
    puts "Dealer's hand is #{dealer_hand}"
    puts "Dealer's hand total value is #{dealer_hand_value}"
    end 
  end 
end 

class BlackJack
  attr_accessor :card_deck, :balance, :bet, :play_again
  def initialize 
    @card_deck = {"2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9,"10"=>10,"Jack"=>10,"Queen"=>10,"King"=>10,"Ace"=>11}
    puts "Please select the amount that you want to deposite"
    @balance = gets.chomp.to_f
    @bet = 0
    @play_again = "Y"
  end 
 
  def start
    begin
    player_one = Player.new(card_deck)
    dealer = Dealer.new(card_deck)
    puts "Please place your bet"
    self.bet = gets.chomp.to_f
    check_bet
    puts player_one.player_initial_cards
    puts player_one.player_total_value
    puts dealer.dealer_initial_cards
    puts dealer.dealer_total_value
    player_one.player_hit_card
    if player_one.player_hand_value < 21
    dealer.dealer_hit_card
    end 
    compare(player_one.player_hand_value, dealer.dealer_hand_value)
    play_again
    end while play_again != "N"
  end 

  def compare(player_total_value,dealer_total_value)
    if player_total_value == 21 && dealer_total_value != 21 
      puts "Blackjack, you won!"
      puts "your balance is #{balance_increment}"
    elsif player_total_value == 21 && dealer_total_value == 21 
      puts "Tie"
      puts "your balance is #{balance}"
    elsif player_total_value > dealer_total_value && player_total_value < 21 
      puts "You Won!"
      puts "your balance is #{balance_increment}"
    elsif player_total_value > 21
      puts "You lost!"
      puts "your balance is #{balance_decrease}"
    elsif player_total_value < dealer_total_value && dealer_total_value <= 21
      puts "you lost!"
      puts "your balance is #{balance_decrease}"
    elsif player_total_value < dealer_total_value && dealer_total_value > 21
      puts "you Won!"
      puts "your balance is #{balance_increment}"
    elsif player_total_value == dealer_total_value
      puts "Tie"
      puts "your balance is #{balance}"
    end 
  end 

  def balance_increment
    self.balance = balance + bet * 2
    balance
  end 

  def balance_decrease 
    self.balance = balance - bet
    balance
  end 

  def play_again
    puts "Do you want to play again (Y/N)?"
    self.play_again = gets.chomp.upcase
  end 

  def check_bet 
    while bet > balance
      puts "insufecient balance, please select a bet which is less than or equal to #{balance}"
      self.bet = puts.chomp.to_f
    end 
  end 
end 

game_one = BlackJack.new 
game_one.start







