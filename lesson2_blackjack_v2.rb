module Cards
  @@card_deck = {"1"=>1,"2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9,"10"=>10,"Jack"=>10,"Queen"=>10,"King"=>10,"Ace"=>11}
  def card_selection
    @@card_deck.keys.sample
  end 

  def card_value(card)
    @@card_deck[card]
  end
end

class Player
  include Cards
  attr_accessor :player_hand, :player_total_value, :player_name, :selection
  def initialize(player_name)
    @player_name = player_name
    @player_hand = []
    @player_total_value = 0
    @selection = ""
  end 

  def initial_cards
    2.times{self.player_hand << card_selection}
    "#{player_name}'s hand is #{player_hand}"
  end 

  def value
    player_hand.select{|x| self.player_total_value = player_total_value + card_value(x)}
    "#{player_name}'s hand value is #{player_total_value}"
  end

  def player_hit_card
    while player_total_value < 21 && selection == "hit"
      card = card_selection
      self.player_hand << card
      self.player_total_value = player_total_value + card_value(card)
      puts "your hand is #{player_hand}"
      puts "your hands valus = #{player_total_value}"
      if player_total_value > 21 
        break
      end
      player_selection
    end 
  end 

  def player_selection
    puts "please select hit or stay"
    self.selection = gets.chomp.downcase
  end 
end 


class Dealer
  include Cards
  attr_accessor :dealer_hand, :dealer_total_value 
  def initialize 
    @dealer_hand = []
    @dealer_total_value = 0
  end 

  def initial_cards
    2.times{dealer_hand << card_selection}
    "Dealer's hand is #{dealer_hand}"
  end 

  def value
    dealer_hand.select{|x| self.dealer_total_value = dealer_total_value + card_value(x)}
    "Dealers's hand value is #{dealer_total_value}"
  end 

  def dealer_hit_card
    while dealer_total_value < 17 
      card = card_selection
      self.dealer_hand << card
      self.dealer_total_value = dealer_total_value + card_value(card)
      puts "Dealr's hand is #{dealer_hand}"
      puts "Dealers hands valus = #{dealer_total_value}"
    end 
  end 
end 

class BlackJack 
  include Cards 

  def start
    puts "Please enter your name"
    player_name = gets.chomp
    player_one = Player.new(player_name)
    dealer = Dealer.new
    puts player_one.initial_cards
    puts player_one.value
    puts dealer.initial_cards
    puts dealer.value
    player_one.player_selection
    player_one.player_hit_card
    dealer.dealer_hit_card
    compare
  end 

  def compare
    if player_one.player_total_value == 21 && dealer.dealer_total_value != 21 
      puts "Blackjack, you won!"
    elsif player_total_value == 21 && dealer_total_value == 21 
      puts "Tie"
    elsif player_total_value > dealer_total_value && player_total_value < 21 
      puts "You Won!"
    elsif player_total_value > 21
      puts "You lost!"
    elsif player_total_value < dealer_total_value && dealer_total_value <= 21
      puts "you lost!"
    elsif player_total_value < dealer_total_value && dealer_total_value > 21
      puts "you Won!"
    elsif player_total_value == dealer_total_value
      puts "Tie"
    end 
  end 
end 

game1 = BlackJack.new
game1.start








