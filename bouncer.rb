def check_laws(age, country,legal_stuff)
  check_quit(country)
  age = age.to_i

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

def check_quit(quit)
  if quit.upcase == "Q"
    puts "Goodbye!"
    exit
  end
end

def check_input_age(age)
  if age.to_i <= 0
    puts "Please enter a valid input"
    set_age
  end
end

def check_input_country(country)
  if !(country.upcase == "US" || country.upcase == "UK")
    puts "Please enter a valid input"
    set_country
  end
end

def set_age
  puts "How old are you? or you can (Q)uit"
  age = gets.chomp
  check_quit(age)
  check_input_age(age)
  return age
end

def set_country
  puts "Do you live in the (UK) or the (US)? or you can (Q)uit"
  country = gets.chomp
  check_quit(country)
  check_input_country(country)
  return country
end

def start
  legal_stuff = ["You can do Nothing", "You can vote!", "You can smoke!",
                "You can drink!", "You can rent a car!"]
  age = set_age
  country = set_country
  check_laws(age,country,legal_stuff)

  loop do
    puts "Would you like to change (A)ge, (C)ountry or (Q)uit?"
    change = gets.chomp
    case change.upcase
    when "A"
      age = set_age
      check_laws(age, country)
    when "C"
      country = set_country
      check_laws(age, country)
    when "Q"
      check_quit(change)
    else
      puts "Please enter a valid input"
    end
  end
end

start
