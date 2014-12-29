class Players

  attr_accessor :first_name, :family_name, :nick_name

  def initialize (first_name,family_name,nick_name)
    @first_name = first_name
    @family_name = family_name
    @nick_name = nick_name
    @selection = ""
  end 

  def player_selection()
    puts "Please select one of the following:
      P => Paper
      R => Rock
      S => Scissors"
    @selection = gets.chomp.upcase 
    return paper_rock_scissors(@selection)
  end 

  def computer_selection()
    return paper_rock_scissors("random")
  end

  def paper_rock_scissors(sel)
    prs = {"P"=>"Paper", "R"=>"Rock", "S"=>"Scissors"}
    if sel != "random"
      return prs[selection]
    else 
      return prs[prs.keys.sample]
    end 
  end 

  def compare (selection_one,selection_two)
    if selection_two == "Rock" && selection_one == "Rock"
      "Drow"
    elsif selection_two == "Rock" && selection_one == "Paper"
      "you win"
    elsif selection_two == "Rock" && selection_one == "Scissors"
      "you lose"
    elsif selection_two == "Paper" && selection_one == "Scissors"
      "you win"
    elsif selection_two == "Paper" && selection_one == "Paper"
      "Drow"
    elsif selection_two == "Paper" && selection_one == "Rock"
      "you lose"
    elsif selection_two == "Scissors" && selection_one == "Rock"
      "you win"
    elsif selection_two == "Scissors" && selection_one == "Paper"
      "you lose"
    elsif selection_two == "Scissors" && selection_one == "Scissors"
      "Drow"
    end 
  end 
end 

puts "Please enter your first name"
f_name = gets.chomp
puts "Please enter your family name"
l_name = gets.chomp
puts "Please enter your nick name"
n_name = gets.chomp

begin

  player_one = Players.new(f_name,l_name,n_name)
  p_selection = player_one.player_selection
  puts "You have selected #{p_selection}"
  c_selection = player_one.computer_selection
  puts "The computer selected #{c_selection}"
  puts player_one.compare(p_selection,c_selection)

  puts "Do you want to play again (Y/N)"
  continue_play = gets.chomp.upcase 

end while continue_play != "N"















