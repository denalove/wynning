class OneMonthGoal < ActiveRecord::Base
  belongs_to :high_level
  has_many :activities

  def progress
    done = 0
		total = 0
		self.activities.each do |act|
			done += 1 if act.done
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
    self.activities.each do |act|
      @complete &= act.done
    end
    self.done = true if @complete
  end

end
