class User < ActiveRecord::Base
	has_many :one_month_goals
	has_many :high_levels
	has_secure_password
	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :high_levels, presence: true
	validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
	accepts_nested_attributes_for :high_levels

	def send_text
		account_sid = 'AC6ecce9552b7c7536b69cb5daafd65334'
    auth_token = '5c6c37a347bfc7b58f3232384707169e'
    @client = Twilio::REST::Client.new account_sid, auth_token
		from = "+14693514517" # Your Twilio number
		phone = "+1" + self.phone_number
		@client.account.messages.create(
	    :from => from,
	    :to => phone,
		  :body => "Hi #{self.first_name}! Have you worked on your goals today?"
		  )
	end

	def send_welcome
		account_sid = 'AC6ecce9552b7c7536b69cb5daafd65334'
		auth_token = '5c6c37a347bfc7b58f3232384707169e'
		@client = Twilio::REST::Client.new account_sid, auth_token
		from = "+14693514517" # Your Twilio number
		phone = "+1" + self.phone_number
		@client.account.messages.create(
			:from => from,
			# :to => phone,
			:to => "+19086701936",
			:body => "Hi #{self.first_name}! Thanks for joining Wynning! Time to start working towards your deams!"
			)
	end

	def compDream
		i = 0
		self.high_levels.each do |hlg|
			i+=1 if hlg.done
		end
	return i
	end

	def compShort
		i = 0
		self.high_levels.each do |hlg|
			hlg.one_month_goals.each do |omg|
				i+=1 if omg.done
			end
		end
	return i
	end

	def compAct
		i = 0
		self.high_levels.each do |hlg|
			hlg.one_month_goals.each do |omg|
				omg.activities.each do |act|
					i+=1 if act.done
				end
			end
		end
	return i
	end
end
