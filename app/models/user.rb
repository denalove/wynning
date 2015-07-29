class User < ActiveRecord::Base
  has_many :OneMonthGoals
  has_secure_password
end
