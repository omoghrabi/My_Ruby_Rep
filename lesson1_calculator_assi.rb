status = "c"
while status != "s" do
  puts "please input your 1st number"

  first_number = gets.chomp

  while kind_of? (first_number) != interger || first_number) == float do
    puts "your input is not an interger nor a float"
    puts "please input your 1st number"
    first_number = gets.chomp!
  end

  puts "please select an operation number from the following list
        1) Add
        2) Subtract
        3) Multiply
        4) Divide"

  operation = gets.chomp

  while !["1","2","3","4"].include? (operation) do
    puts "Your input is not valid" 
    puts "please select an operation number from the following list
          1) Add
          2) Subtract
          3) Multiply
          4) Divide"
    operation = gets.chomp
  end

  puts "please input your 2nd number"
  
  second_number = gets.chomp.to_f
  
  while second_number.is_a? == integer || second_number.is_a? == float do
    puts "your input is not an interger nor a float"
    puts "please input your 2nd number"
    first_number = gets.chomp!
  end

  case operation

  when "1"

    puts "the sum of #{first_number} and #{second_number} is #{first_number + second_number}"

  when "2"

    puts "the subtraction of #{second_number} from #{first_number} is #{first_number - second_number}"

  when "3"

    puts "the multiplication of #{first_number} by #{second_number} is #{first_number * second_number}"

  when "4"
    if second_number == 0
      puts "Error: can not divide by zero"
    else
      puts "the division of #{first_number} by #{second_number} is #{first_number / second_number}"
    end 

  end 

  puts "If you wish to exit the calculator enter s otherwise enter c"

  status = gets.chomp.downcase

end 
