class ArtistsController < ApplicationController
  def index
    @users = User.all
  end
end
