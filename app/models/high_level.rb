class HighLevel < ActiveRecord::Base
  belongs_to :user
  has_many :one_month_goals
  accepts_nested_attributes_for :one_month_goals

  def progress
		done = 0
		total = 0
		self.one_month_goals.each do |gol|
      gol.check
			done += 1 if gol.done
			total += 1
		end
		done*=100
		if total == 0
			percent = 0
		else
			percent = done/total
		end
	end

  def check
    @complete = true
    self.one_month_goals.each do |omg|
      @complete &= omg.done
    end
    if self.one_month_goals.count > 0
       if @complete
         self.done = true
       else
         self.done = false
       end
    else
      self.done = false
    end
    self.save
    end
end
