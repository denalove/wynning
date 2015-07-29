class OneMonthGoal < ActiveRecord::Base
  belongs_to :user
  has_many :activities
end
