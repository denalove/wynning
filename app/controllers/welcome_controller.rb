class WelcomeController < ApplicationController

  def new
  end

  def index
  end

  def landing
    User.send_text
  end

end
