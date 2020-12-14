class Api::V1::EventsController < ApplicationController
    skip_before_action :require_login

    def index
        events = Event.all
        render json: events
    end
end
