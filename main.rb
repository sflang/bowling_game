require 'pry'
require './frame'
require './game'

def get_input

  puts "Enter ball sequence for game:"
  gets.chomp  
end

def put_game_score(game)
  total = 0
  puts " Frame   Score"
  puts " -------------"
  9.times do |i|

  	total += game.frames[i].score  	
  	puts "    #{i + 1}     #{total}"
  end
  total += game.frames[9].score 
  puts "   10     #{total}"
end



bowling_game = Game.new
ball_scores  = get_input

bowling_game.play(ball_scores)

put_game_score(bowling_game)

