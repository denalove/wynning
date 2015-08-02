class UserMailer < ApplicationMailer

	def welcome_email(user)
		@user = user
		@url = 'http://wynning.co/Login'
		email_with_name = %("#{@user.first_name}" <#{@user.email} > )
		mail(to: email_with_name, subject: 'Welcome to Wynning!')
	end

end
