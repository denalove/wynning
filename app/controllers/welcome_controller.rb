class WelcomeController < ApplicationController

  def new
  end

  def index
  end

  def stream
    # This is the user activity stream
    @stream = {}
    @users = User.all

    @users.each do |usr|
      usr.high_levels.each do |hlg|
        day = hlg.updated_at.to_i
        hlg.check
        @stream[day] = [hlg, usr] if hlg.done
        hlg.one_month_goals.each do |omg|
          day = omg.updated_at.to_i
          omg.check
          @stream[day] = [omg, usr] if omg.done
            omg.activities.each do |act|
              day = act.updated_at.to_i
              @stream[day] = [act, usr] if act.done
            end
        end
      end
    end
    @stream = @stream.sort { |x,y| y<=>x}
  end

  def landing

  end

end
