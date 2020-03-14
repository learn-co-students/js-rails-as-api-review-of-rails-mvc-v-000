# Add code from Readme
class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end
end