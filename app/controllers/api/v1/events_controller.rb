class Api::V1::EventsController < ApplicationController
    skip_before_action :require_login, only: [:index]

    def index
        events = Event.all
        render json: events
    end

    def create 
        event = Event.new(event_params)
        if params["photo"] == "null"
          #attach a default photo 
          event.photo.attach(io:File.open("app/assets/logo/staged_logo.png"), filename: "staged_logo.png", content_type: "image/png")
        end
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

    def followed_events
      byebug
      # find events that the user doesn't have 
    end

    def suggested_events
      user_followed_ids = @user.followed.map { |band| band.id }
      user_band_ids = @user.bands.map { |band| band.id }
      all_ids = user_followed_ids + user_band_ids
      suggested_events = Event.where.not( band_id: all_ids)
      .where("date > ?", Date.today)
      .sample(5)
      render json: suggested_events
    end

    private
    
    def event_params
        params.permit("name", "date", "url", "event_type", "band_id", "photo")
    end

end
