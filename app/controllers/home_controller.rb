class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to  edit_user_path(current_user)
    end
  end
end
