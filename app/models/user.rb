class User < ActiveRecord::Base
	has_many :one_month_goals
	has_secure_password
	#validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :high_level_goal, presence: true
	validates :username, presence: true, length: { minimum: 5 }, uniqueness: true

	def progress
		done = 0
		total = 0
		self.one_month_goals.each do |gol|
			gol.activities.each do |act|
				done += 1 if act.done
				total += 1
			end
		end
		done*=100
		percent = done/total
	end

end
