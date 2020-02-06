# Add code from Readme

class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    # due to Rails convention over configuration, we don't need to type the following
    # because there is a *folder* and a *file* corresponding to a *controller* and an *action* from that controller
    # render 'birds/index.html.erb'
  end
end
