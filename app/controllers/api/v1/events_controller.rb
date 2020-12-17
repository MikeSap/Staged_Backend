class Api::V1::EventsController < ApplicationController
    skip_before_action :require_login

    def index
        events = Event.all
        render json: events
    end

    def create     
        event = Event.new(event_params)
        
        # if params["photo"] == "null"
        #     return render json: {errors: ["Must Have Photo Attached"]}, status: 401   
        # end 

        return render json: {errors: event.errors.full_messages}, status: 401 unless event.save  
        render json: event
    end

    def update
        event = Event.find(params["id"])
        event.update(event_params)
        if event.valid?
            render json: event
        else
            render json: {errors: event.errors.fullmessages}, status: 401
        end
    end

    def destroy
        event = Event.find(params["id"])
        event.destroy
        render json: event
    end

    private
    
    def event_params
        params.permit("name", "date", "url", "event_type", "band_id")
    end

end
