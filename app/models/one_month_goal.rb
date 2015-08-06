class OneMonthGoal < ActiveRecord::Base
  belongs_to :high_level
  has_many :activities
  accepts_nested_attributes_for :activities
end
