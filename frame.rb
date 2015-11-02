class Frame
	
  attr_accessor :ball_scores, :frame_score

  #initialize ball scores
  def init_ball_scores(scores)

    self.ball_scores = scores
  end
    
  #sum the ball score array
  def score

    self.ball_scores.inject(0) do |sum, i| 
	  sum += i
	end
  end

  def strike?

    self.ball_scores[0] == 10
  end

  def spare?

    self.ball_scores.length > 1                     &&
	self.ball_scores[0] + self.ball_scores[1] == 10
  end
end


	