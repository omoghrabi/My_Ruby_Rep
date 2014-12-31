class Player
  attr_accessor :first_name, :last_name, :nick_name
  def initialize(first_name,last_name,nick_name)
    @first_name = first_name
    @last_name = last_name
    @nick_name = nick_name
  end 
  puts "Welcome #{:first_name} to the Blackjack game"
end 

module Cards
  @@card_deck = {"1"=>1,"2"=>2,"3"=>3,"4"=>4,"5"=>5,"6"=>6,"7"=>7,"8"=>8,"9"=>9,"10"=>10,"Jack"=>10,"Queen"=>10,"King"=>10,"Ace"=>11}
  end 
  def card_selection
    @@card_deck.keys.sample
  end 
  def card_value(card)
    @@card_deck[card]
  end
end 

class PlayerHand 
  include Cards
  attr_accessor :player_hand
  @@player_hand
  def initialize
    @player_hand=[]
  end 
  def player_initial_hand
    2.times {player_hand << card_selection}
    puts player_hand
  end
  def player_hit_card
    self.player_hand << card_selection
  end 
  def player_hand_value 
    hand_value = player_hand.each { |x| hand_value + card_value(x)}
    return hand_value
  end 
end 

class DealerHand < Cards
  attr_accessor :dealer_hand
  def initialize
    @dealer_hand=[]
  end
  def dealer_initial_hand
    dealer_hand = []
    2.times {dealer_hand << card_selection}
    return dealer_hand
  end
  def dealer_hand_value 
    hand_value = dealer_hand.each { |x| hand_value + card_value(x)}
    return hand_value
  end 
end 

class GameEngine
  def compare(dealer_hand,player_hand)
    if player_hand == 21 && dealer_hand != 21 
      "Blackjack, you won!"
    elsif player_hand ==21 && dealer_hand == 21 
      "Tie"
    elsif player_hand > dealer_hand && player_hand < 21 
      "You Won!"
    elsif player_hand > 21
      "You lost!"
    elsif player_hand < dealer_hand && dealer_hand <= 21
      "you lost!"
    elsif player_hand < dealer_hand && dealer_hand > 21
      "you Won!"
    elsif player_hand == dealer_hand
      "Tie"
    end 
  end 
end 

player_one = Player.new("om","mog","oae")
deck1 = Cards.new
player_one_hand = PlayerHand.new
dealer_one_hand = DealerHand.new
game_one = GameEngine.new

puts deck1.card_selection
puts dealer_one_hand.dealer_initial_hand

 
