class OneMonthGoal < ActiveRecord::Base
  belongs_to :high_level
  has_many :activities

  accepts_nested_attributes_for :activities


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
    if self.activities.count > 0
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
