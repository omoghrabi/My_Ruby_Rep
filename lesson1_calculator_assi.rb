status = "c"
while status!= "s" do
  puts "please input your 1st number"
  num1=gets.chomp.to_f

  puts "please select an operation number from the following list
        1) Add
        2) Subtract
        3) Multiply
        4) Divide"

operation=gets.chomp

puts "please input your 2nd number"
  num2=gets.chomp.to_f


case operation

  when "1"

  puts num1 + num2


  when "2"

  puts num1 - num2


  when "3"

  puts num1 * num2


  when "4"

  puts num1 / num2

end 

puts "If you wish to exit the calculator enter s otherwise enter c"

status=gets.chomp.undercase 
end 
