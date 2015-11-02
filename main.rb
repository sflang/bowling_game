require 'pry'
require './frame'
require './game'

def get_ball_sequence

  puts "Enter ball sequence for game:"
  gets.chomp  
end

def put_game_score(game)
  puts " Frame   Score"
  puts " -------------"
  9.times do |i|
 	
  	puts "    #{i + 1}     #{game.frames[i].frame_score}"
  end
  
  puts "   10     #{game.frames[9].frame_score}"
end



bowling_game = Game.new
ball_scores  = get_ball_sequence

bowling_game.play(ball_scores)

put_game_score(bowling_game)

