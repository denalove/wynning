class User < ActiveRecord::Base
	has_many :one_month_goals
	has_many :high_levels
	has_secure_password
	#validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :high_levels, presence: true
	validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
	accepts_nested_attributes_for :high_levels


end
