class Api::V1::EventsController < ApplicationController
    skip_before_action :require_login, only: [:index, :music, :merch, :shows]

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
         if params["photo"] == "null"
          event.update(no_photo_params)
        else
          event.update(event_params)
        end 
        event = Event.find(params["id"])
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
      user_followed_ids = @user.followed.map { |band| band.id }
      followed_events = Event.where( band_id: user_followed_ids).where("date > ?", Date.today).order(date: :asc).page(params[:page].to_i)
      # last_page = Event.where( band_id: user_followed_ids).where("date > ?", Date.today).order(date: :asc).page(params[:page].to_i).last_page?
      # send this back and save to store, if last page, disable button 
      render json: followed_events
    end

    def suggested_events
      user_followed_ids = @user.followed.map { |band| band.id }
      user_band_ids = @user.bands.map { |band| band.id }
      all_ids = user_followed_ids + user_band_ids
      suggested_events = Event.where.not( band_id: all_ids)
      .where("date >= ?", Date.today)
      .sample(5)
      render json: suggested_events
    end

    def date_events
      date_events = Event.where("DATE(date) = ?", params[:date].to_time)
      render json: date_events
    end

    def managed_events
      managed_events = Event.where( band_id: params["band_id"].to_i).where("date >= ?", Date.today).order(date: :asc).page(params[:page].to_i)
      render json: managed_events
    end

    def music
      events = Event.where(event_type: "Music").where("date >= ?", Date.today).order(date: :asc).page(params[:page].to_i)
      render json: events
    end
    
    def merch
      events = Event.where(event_type: "Merch").where("date >= ?", Date.today).order(date: :asc).page(params[:page].to_i)
      render json: events
    end
    
    def shows
      events = Event.where(event_type: "Show").where("date >= ?", Date.today).order(date: :asc).page(params[:page].to_i)
      render json: events
    end

    private
    
    def event_params
        params.permit("name", "date", "url", "event_type", "band_id", "photo", "location")
    end

    def no_photo_params
        params.permit("name", "date", "url", "event_type", "band_id", "location")
    end

end
