class Activity < ActiveRecord::Base
  belongs_to :one_month_goal


  def daily_complete
    @completed =[]
    day = self.start.yday
    today = Time.new.yday
    diff = day - today
    @completed[diff] = true
    @completed
  end

  def score
    @score=0
    @completed.each do |check|
      @score +=1 if check
    end
    @score *= 100
    @score /= 7
    @score
  end

end
