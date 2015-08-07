desc "This task is called by the Heroku scheduler add-on"

task :send_daily_email => :environment do
  puts "Sending daily emails..."
  User.all.each do |user|
  	UserMailer.daily_activity_email(user).deliver_now
  end
  puts "done."
end

task :send_daily_text => :environment do
  User.all.each do |user|
    user.send_text
  end
end
