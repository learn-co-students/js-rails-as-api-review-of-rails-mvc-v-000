class BirdsController < ApplicationController
  def index
    @birds = Bird.all.abc_name
    render 'birds/index.html.erb'
  end
end