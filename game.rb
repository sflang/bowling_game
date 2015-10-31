class Game

	attr_accessor :frames

	def initialize
	  #Every game has 10 frames
	  self.frames = []
	  10.times {self.frames << Frame.new}
	end


    #initialize the ball scores in each frame
	def init_frame_scores(ball_scores)

	  ball_scores.each_with_index do |scores, i|
		self.frames[i].init_ball_scores(scores)
	  end
	end

	#now walk the frames array and look for spares and strikes
	#update the ball_score_multipliers based on strikes/spares in the first 9 frames
	def update_frame_scores
      
      self.frames.each_with_index do |frame, i|
      	if i < 9
      	  #if strike or spare increment multiplier for the first ball in the next frame
      	  if frame.strike? || frame.spare?

            self.frames[i+1].ball_score_multipliers[0] += 1
          end
          
          #if strike, increment multiplier for the second ball, which may be located
          #in the next frame, or the next next frame
      	  if frame.strike?
            
            self.frames[i+1].ball_score_multipliers.length > 1 ?
              self.frames[i+1].ball_score_multipliers[1] += 1  : 
              self.frames[i+2].ball_score_multipliers[0] += 1
          end
        end
      end
    end

    def final_score

      self.frames.inject(0) {|sum, frame| sum += frame.score}
    end
end
