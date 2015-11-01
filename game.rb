class Game

	attr_accessor :frames

	def initialize
	  #Every game has 10 frames
	  self.frames = []
	  10.times {self.frames << Frame.new}
	end

  def play(ball_scores)
    #Convert string to array of ball scores
    ball_score_array = ball_scores.split.map { |ball| ball.to_i}

    #Initialize frames with the ball scores in each frame
    init_frame_scores(form_ball_sequence(ball_score_array))
    
    #Walk the frames, looking for strikes and spares and update the 
    #ball scores in the corresponding frame
    update_frame_scores

  end


  private
  
  #Construct the frames_scores array of one, two or three ball scores per frame
  def form_ball_sequence(ball_scores)
  
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
  
  #initialize the ball scores in each frame
	def init_frame_scores(frame_scores)

	  frame_scores.each_with_index do |scores, i|
		self.frames[i].init_ball_scores(scores)
	  end
	end

	#Walk the first 9 elements of the frames array and look for spares and strikes
	#update the ball_score_multipliers based on strikes/spares
	def update_frame_scores
      
    self.frames[0..8].each_with_index do |frame, i|

    #if strike or spare, push the first ball score in the next frame
	  if frame.strike? || frame.spare?

      self.frames[i].ball_scores << self.frames[i+1].ball_scores[0]
    end
          
    #if strike, push the second ball, which may be located
    #in the next frame, or the next next frame
    if frame.strike?
            
      self.frames[i+1].ball_scores.length > 1 ?
        self.frames[i].ball_scores << self.frames[i+1].ball_scores[1] : 
        self.frames[i].ball_scores << self.frames[i+2].ball_scores[0]
      end
    end
  end

end
