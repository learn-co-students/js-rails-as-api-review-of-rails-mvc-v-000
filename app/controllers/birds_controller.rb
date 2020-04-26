class BirdsController < ApplicationController

  def index
    @birds = Birds.all
    render 'birds/index.html.erb'
  end

end
