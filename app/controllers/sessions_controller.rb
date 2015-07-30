class SessionsController < ApplicationController
  def new

  end

  def index
  	# redirect_to users_path
  end


    def create
  	@user = User.find_by(username: params[:username]).try(:authenticate, params[:password])

  	if @user
  		session[:user_id] = @user.id
  		redirect_to @user
  	else
  		render action: 'new'
  	end
  end
end

