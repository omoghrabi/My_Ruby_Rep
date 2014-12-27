#black jack game

puts "Welcome to the Blackjack game"
card_deck = {1=>1,2=>2,3=>3,4=>4,5=>5,6=>6,7=>7,8=>8,9=>9,10=>10,"Jack"=>10,"Queen"=>10,"King"=>10,"Ace"=>11}
player_hand = []
dealer_hand = []
begin 
  #palyer initial two cards 
  player_first_card = card_deck.keys.sample()
  player_hand << player_first_card
  player_second_card = card_deck.keys.sample()
  player_hand << player_second_card
  puts "your first two cards are #{player_hand}"
  player_cards_sum = card_deck[player_first_card] + card_deck[player_second_card]
  puts "your total is #{player_cards_sum}"
  #dealer initial two cards
  dealer_first_card = card_deck.keys.sample()
  dealer_hand << dealer_first_card
  dealer_second_card = card_deck.keys.sample()
  dealer_hand << dealer_second_card
  puts "dealer first two cards are #{dealer_hand}"
  dealer_cards_sum = card_deck[dealer_first_card] + card_deck[dealer_second_card]
  puts "dealer total is #{dealer_cards_sum}"
  #player choice "hit" or "stay" and card output 
  player_choice = "hit"
  while player_cards_sum < 21 && player_choice == "hit" 
    puts "Do you want to Hit or Stay"
    player_choice = gets.chomp.downcase
    unless player_choice == "hit" || "stay" 
      puts "your input is not valid, please select either hit or stay"
      player_choice = gets.chomp!
    end 
    if player_choice == "hit"
      player_hit_card = card_deck.keys.sample()
      player_hand << player_hit_card
      player_cards_sum = player_cards_sum + card_deck[player_hit_card]
    end 
    # if player_cards_sum >= 21 && player_hand.include? ("Ace")
    #   player_cards_sum = player_cards_sum - player_hand.count ("Ace") * 10 
    #end
    puts "your hand is #{player_hand}"
    puts "your total is #{player_cards_sum}"
  end 
  #dealer card output
  while dealer_cards_sum < 17 
    dealer_hit_card = card_deck.keys.sample()
    dealer_hand << dealer_hit_card
    dealer_cards_sum = dealer_cards_sum + card_deck[dealer_hit_card]
    puts "dealers hand is #{dealer_hand}"
    puts "dealer total is #{dealer_cards_sum}"
  end
  #compare dealer and player card cands 
  if player_cards_sum == 21 && dealer_cards_sum != 21 
    puts "Blackjack, you won!"
  elsif player_cards_sum ==21 && dealer_cards_sum == 21 
    puts "Tie"
  elsif player_cards_sum > dealer_cards_sum && player_cards_sum < 21 
    puts "You Won!"
  elsif player_cards_sum > 21
    puts "You lost!"
  elsif player_cards_sum < dealer_cards_sum && dealer_cards_sum <= 21
    puts "you lost!"
  elsif player_cards_sum < dealer_cards_sum && dealer_cards_sum > 21
    puts "you Won!"
  end 

  play_again = "n"

end while play_again != "n"