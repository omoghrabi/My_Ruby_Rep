#black jack game

puts "Welcome to the Blackjack game"

card_deck = {"1":1,"2":2,3:3,4:4,5:5,6:6,7:7,8:8,9:9,10:10,"Jack":10,"Queen":10,"King":10,"Ace":11}

begin 
  #palyer initial two cards 
  player_first_card = card_deck.keys.sample().to_sym
  player_second_card = card_deck.keys.sample().to_sym
  puts "your first two cards are #{player_first_card} and #{player_second_card}"
  player_cards_sum = card_deck[player_first_card] + card_deck[player_second_card]
  puts "your total is #{player_cards_sum}"
  #dealer initial two cards
  dealer_first_card = card_deck.keys.sample().to_sym
  dealer_second_card = card_deck.keys.sample().to_sym
  puts "dealer first two cards are #{dealer_first_card} and #{dealer_second_card}"
  dealer_cards_sum = card_deck[dealer_first_card] + card_deck[dealer_second_card]
  puts "dealer total is #{dealer_cards_sum}"
  #player choice "hit" or "stay"
  player_chocie == "hit"
  while player_total <= 21 && player_chocie == "hit"
    puts "Do you want to Hit or Stay"
    player_chocie = gets.chomp.downcase
    unless player_chocie == "hit" || "stay" do
      puts "your input is not valid, please select either hit or stay"
      player_chocie! = gets.chomp
    end 
    player_hit_card = card_deck.keys.sample().to_sym
    player_total = player_total + card_deck[player_hit_card]
    puts "your total is #{player_total}"
  end 
  while dealer_total <= 21 
    dealer_hit_card = card_deck.keys.sample().to_sym
    dealer_total = dealer_total + card_deck[dealer_hit_card]
    puts "dealer total is #{dealer_total}"
  end



end while paly_again != "n"