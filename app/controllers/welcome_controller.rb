class WelcomeController < ApplicationController

  def new
  end

  def index
    # This is the user activity stream
    @stream = {}
    @users = User.all

    @users.each do |usr|
      usr.high_levels.each do |hlg|
        hlg.one_month_goals.each do |omg|
            omg.activities.each do |act|
              day = act.created_at.to_i
              @stream[day] = [act, usr] if act.done
            end
        end
      end
    end
  @stream = @stream.sort { |x,y| x<=>y}
  end

  def landing

  end

end
