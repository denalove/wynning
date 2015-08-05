class OneMonthGoal < ActiveRecord::Base
  belongs_to :user
  belongs_to :high_level
  has_many :activities
  
end
