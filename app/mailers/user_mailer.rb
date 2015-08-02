class UserMailer < ApplicationMailer

	def welcome_email(user)
		@user = user
		@url = 'http://wynning.co'
		email_with_name = %("#{@user.first_name.capitalize}" <#{@user.email} > )
		mail(to: email_with_name, subject: 'Welcome to Wynning!')
	end

end
