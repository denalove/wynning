class Activity < ActiveRecord::Base
  belongs_to :one_month_goal

  def complete
      self.score ||= 0
      self.score += 1
      self.save
  end

end
