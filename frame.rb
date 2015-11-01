class Frame
	
  attr_accessor :ball_scores, :ball_score_multipliers

  #initialize ball scores and reset score multipliers
  def init_ball_scores(scores)

    self.ball_scores = scores
	self.ball_score_multipliers = scores.map { |i| 1}
  end
    
  #multiply each ball score by its mutiplier and sum result
  def score

    (0...self.ball_scores.length).inject(0) do |sum, i| 
	  sum += self.ball_scores[i] * self.ball_score_multipliers[i]
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


	