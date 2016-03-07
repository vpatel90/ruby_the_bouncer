def check_age(age)
  if age.upcase == "Q"
    exit
  end
  age = age.to_i
  legal_stuff = ["You can do Nothing", "You can vote!", "You can smoke!",
                "You can drink!", "You can rent a car!"]
  if age < 18
    puts legal_stuff[0]
  elsif age < 21
    puts legal_stuff[1..2]
  elsif age < 25
    puts legal_stuff[1..3]
  else
    puts legal_stuff[1..4]
  end
end

loop do
  puts "How old are you? or you can (Q)uit"
  check_age(gets.chomp)
end
