class HomeController < ApplicationController
  def index
  	@arts = Art.all
  end
end
