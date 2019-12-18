class BirdsController < ApplicationController

  def index
    @birds = Bird.all
  end

end

  # Add code from Readme
