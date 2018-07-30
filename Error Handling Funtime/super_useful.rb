class CoffeeError < ArgumentError; end
class BestFriendError < ArgumentError; end
class NoInfoError < ArgumentError; end

# PHASE 2
def convert_to_int(str)
  Integer(str)

  rescue ArgumentError
    nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit.downcase == "coffee"
    raise CoffeeError
  else
    puts "Blegh!! That's not a fruit!"
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts "Coffee's greaatttt I guess... Now I'm hungry for fruit though... Maybe an apple or something?"
    retry
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

    if @name.length == 0 || @fav_pastime.length == 0
      puts "We're gonna need a little more info if you're actually best friends..."
      raise NoInfoError
    end

    if @yrs_known  < 5
      puts "Y'all ain't best friends yet! You'll need #{5 - @yrs_known} more years to be best friends."
      raise BestFriendError
    end

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
