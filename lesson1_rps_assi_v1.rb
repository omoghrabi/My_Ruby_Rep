puts "Play Paper Rock Scissors"
x= "Y"
while x == "Y"
  prs = {p: "Paper", r: "Rock", s: "Scissors"}

  puts "please select one of the following p/r/s"

  user_selection = gets.chomp.downcase.to_sym

  puts "you have selected #{prs[user_selection]}"

  computer_option = ["p","r","s"]

  computer_option = computer_option.sample.to_sym

  puts "the computer selected #{prs[computer_option]}"

  case prs[user_selection] == "Paper"

  when prs[computer_option] == "Rock"

    puts "you win"

  when prs[computer_option] == "Scissors"

    puts "you lose"

  when prs[computer_option] == "Paper"

    puts "Drow"

  end 

  case prs[user_selection] == "Rock"

  when prs[computer_option] == "Rock"

    puts "Drow"

  when prs[computer_option] == "Scissors"

    puts "you win"

  when prs[computer_option] == "Paper"

    puts "you lose"

  end 

  case prs[user_selection] == "Scissors"

  when prs[computer_option] == "Rock"

    puts "you lose"

  when prs[computer_option] == "Scissors"

    puts "Drow"

  when prs[computer_option] == "Paper"

    puts "you win"

  end 

  puts "Play again?"

  x = gets.chomp.upcase

end 
