class HomeController < ApplicationController
  def index
  	@arts = Art.all
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end
end
