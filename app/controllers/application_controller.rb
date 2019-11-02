class ApplicationController < ActionController::Base
    def index
        @birds = Bird.all
    end
end
