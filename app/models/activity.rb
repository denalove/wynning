class Activity < ActiveRecord::Base
  belongs_to :one_month_goal

  def daily_complete
    day = self.start.yday
    today = Time.new.yday
    diff = today - day

    case diff
    when 0
      self.day1 = true
    when 1
      self.day2 = true
    when 2
      self.day3 = true
    when 3
      self.day4 = true
    when 4
      self.day5 = true
    when 5
      self.day6 = true
    when 6
      self.day7 = true
    end
    self.save
  end

  def score
    completed = [self.day1, self.day2, self.day3, self.day4, self.day5, self.day6, self.day7]
    progress = 0
    completed.each do |check|
      progress += 1 if check
    end
    progress *= 100
    progress /= 7
    progress
  end

end
