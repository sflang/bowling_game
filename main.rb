require 'pry'
require './frame'
require './game'


#returns a 10 element array of the ball scores for each frame.  Each ball score is 
#a one or two element array (depending on one or two balls in the frame), except for
#the last frame which can contain up to three elements
def get_ball_sequence
  puts "Enter ball sequence for game:"
  ball_scores   = gets.chomp.split.map { |ball| ball.to_i}
  frame_scores  = []
  
  #The first nine frames contain either one or two ball scores
  9.times { frame_scores.push ball_scores[0] == 10 ? ball_scores.shift(1) : ball_scores.shift(2) }
  
  #the last frame contains all of the remaining balls
  frame_scores.push ball_scores

  #Error checking would include:
  # checking for the presence of any nils in frame_scores (too few balls scores)
  # checking ball_scores.length > 3 (indicating too many ball scores)
  # and others (each ball score must be 0..10 and each frame_scores element must sum to 0..10, except 10th frame_score sums to 0..30))
  # These checks are not implemented
end

def get_game_score(game)
  total = 0
  puts " Frame   Score  Total Score"
  puts " --------------------------"
  10.times do |i|

  	total += game.frames[i].score  	
  	puts "    #{i + 1}     #{game.frames[i].score}     #{total}"
  end
end



bowling_game = Game.new
frame_scores = get_ball_sequence

bowling_game.init_frame_scores(frame_scores)
bowling_game.update_frame_scores

get_game_score(bowling_game)

