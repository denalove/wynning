class User < ActiveRecord::Base
  has_many :one_month_goals
  has_secure_password
end
