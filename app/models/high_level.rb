class HighLevel < ActiveRecord::Base
  belongs_to :user
  has_many :one_month_goals
  accepts_nested_attributes_for :one_month_goals

end
