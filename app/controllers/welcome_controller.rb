class WelcomeController < ApplicationController
  def show
    if logged_in?
      redirect_to user_path(current_user)
    else
    end
  end
end
