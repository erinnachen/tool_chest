class WelcomeController < ApplicationController
  def show
    if logged_in?
      redirect_to user_path
    else
    end
  end
end
