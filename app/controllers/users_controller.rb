class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def index
    render :new
  end
end
