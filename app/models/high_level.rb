class HighLevel < ActiveRecord::Base
  belongs_to :user
  has_many :one_months_goals
  
end
