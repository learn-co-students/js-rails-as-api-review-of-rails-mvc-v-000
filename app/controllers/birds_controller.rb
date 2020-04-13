class BirdsController < ApplicationController
  def index
    @birds = Birds.all
  end
end
