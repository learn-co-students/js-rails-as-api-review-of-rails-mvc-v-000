# Add code from Readme
class BirdsController < ApplicationController
    def index
        @birds = Bird.All
    end
end