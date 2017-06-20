require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"] || "x"
  message = check_guess(guess)
  erb :index, :locals => {:number  => SECRET_NUMBER,
                          :message => message,
                          :color   => set_background(guess)
                         }
end


def check_guess(guess)
  if guess == "x"
    "I've picked a number from 1-100. Make a guess!"
  elsif guess.to_i == SECRET_NUMBER
    "Correct!\n The secret number is #{SECRET_NUMBER}"
  elsif guess.to_i > SECRET_NUMBER
    high_message(guess)
  elsif guess.to_i < SECRET_NUMBER
    low_message(guess)
  end
end

def set_background(guess)
  if guess == "x"
    "#c8c8c8"
  elsif guess.to_i == SECRET_NUMBER
    green_background
  elsif (guess.to_i > (SECRET_NUMBER + 5)) || (guess.to_i < (SECRET_NUMBER - 5))
    red_background
  elsif (guess.to_i > (SECRET_NUMBER)) || (guess.to_i < (SECRET_NUMBER))
    light_red_background
  end
end

private

def high_message(guess)
  if guess.to_i > (SECRET_NUMBER + 5)
    "Way too high! Guess again."
  else
    "Too High. Guess again."
  end
end

def low_message(guess)
  if guess.to_i < (SECRET_NUMBER - 5)
    "Way too low! Guess again."
  else
    "Too low. Guess again."
  end
end

def red_background
  "red"
end

def light_red_background
  "#c86464"
end

def green_background
  "green"
end
