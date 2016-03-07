def check_age(age, country)
  check_quit(country)
  age = age.to_i
  legal_stuff = ["You can do Nothing", "You can vote!", "You can smoke!",
                "You can drink!", "You can rent a car!"]

  if (age == 16 || age == 17) && country.upcase == "UK"
    puts "Are you with your parents? (Y)es or (N)o"
    answer = gets.chomp
    if answer.upcase == "Y"
      puts legal_stuff[3]
    else
      puts legal_stuff[0]
    end
  elsif age < 18
    puts legal_stuff[0]
  elsif age < 21 && country.upcase == "UK"
    puts legal_stuff[1..3]
  elsif age < 21
    puts legal_stuff[1..2]
  elsif age < 25
    puts legal_stuff[1..3]
  else
    puts legal_stuff[1..4]
  end
end

def country_check(age)
  check_quit(age)
  puts "Do you live in the (UK) or the (US)? or you can (Q)uit"
  check_age(age, gets.chomp)
end

def check_quit(quit)
  if quit.upcase == "Q"
    exit
  end
end

loop do
  puts "How old are you? or you can (Q)uit"
  country_check(gets.chomp)
end
