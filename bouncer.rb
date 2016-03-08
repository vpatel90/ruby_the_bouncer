def input #adds the > whenever user is entering input
  print ">"
  return gets.chomp
end

def check_UK_laws(age, country, legal_stuff)
  if (age == 16 || age == 17)
    puts "Are you with your parents? (Y)es or (N)o"
    answer = input
    if answer.upcase == "Y"
      puts legal_stuff[3]
    elsif answer.upcase == "N"
      puts legal_stuff[0]
    else
      puts "Please enter a valid input"
      check_UK_laws(age, country,legal_stuff)
    end
  elsif age < 21
    puts legal_stuff[1..3]
  end
end

def check_laws(age, country)
  legal_stuff = ["You can do Nothing", "You can vote!", "You can smoke!",
                "You can drink!", "You can rent a car!"]

  if age < 21 && age > 15 && country == "UK"
    return check_UK_laws(age,country,legal_stuff)
  end

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

def check_quit(quit)
  if quit.upcase == "Q"
    puts"Goodbye!"
    exit
  end
  return quit
end

def check_input_age(age)
  if age.to_i <= 0
    puts "Please enter a valid input"
    set_age
  end
end

def check_input_country(country)
  valid_countries = ["US","UK"]
  if !valid_countries.include?(country.upcase)
    puts "Please enter a valid input"
    set_country
  end
end

def set_age
  puts "How old are you? or you can (Q)uit"
  age = check_quit(input)
  check_input_age(age)
  return age.to_i
end

def set_country
  puts "Do you live in the (UK) or the (US)? or you can (Q)uit"
  country = check_quit(input)
  check_input_country(country)
  return country.upcase
end

def start
  age = set_age
  country = set_country
  check_laws(age,country)

  loop do
    puts "Would you like to change (A)ge, (C)ountry, (B)oth or (Q)uit?"
    change = input
    case change.upcase
    when "A"
      age = set_age
      check_laws(age, country)
    when "C"
      country = set_country
      check_laws(age, country)
    when "B"
      start
    when "Q"
      check_quit(change)
    else
      puts "Please enter a valid input"
    end
  end
end

start
