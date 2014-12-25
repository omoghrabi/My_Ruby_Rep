puts "Play Paper Rock Scissors"
x= "Y"
while x == "Y" do
  prs = {p: "Paper", r: "Rock", s: "Scissors"}
  puts "please select one of the following p/r/s"
  user_selection = gets.chomp.downcase.to_sym
  puts "you have selected #{prs[user_selection]}"
  computer_option = ["p","r","s"]
  computer_option = computer_option.sample.to_sym
  puts "the computer selected #{prs[computer_option]}"
  if prs[computer_option] == "Rock" && prs[user_selection] == "Rock"

    puts "Drow"

  elsif prs[computer_option] == "Rock" && prs[user_selection] == "Paper"

    puts "you win"

  elsif prs[computer_option] == "Rock" && prs[user_selection] == "Scissors"

    puts "you lose"

  elsif prs[computer_option] == "Paper" && prs[user_selection] == "Scissors"

    puts "you win"

  elsif prs[computer_option] == "Paper" && prs[user_selection] == "Paper"

    puts "Drow"

  elsif prs[computer_option] == "Paper" && prs[user_selection] == "Rock"

    puts "you lose"

  elsif prs[computer_option] == "Scissors" && prs[user_selection] == "Rock"

    puts "you win"

  elsif prs[computer_option] == "Scissors" && prs[user_selection] == "Paper"

    puts "you lose"

  elsif prs[computer_option] == "Scissors" && prs[user_selection] == "Scissors"

    puts "Drow"

  end 
  puts "Play again?"
  x = gets.chomp.upcase
end 
