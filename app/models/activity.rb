class Activity < ActiveRecord::Base
  belongs_to :one_month_goal

  def complete
    self.done = true
    self.save
    self.last ||= Time.new(1987, 7, 24)
      if self.last.yday != Time.now.yday
        self.score ||= 0
        self.score += 1
        self.last = Time.now
        self.save
      end
  end

end
