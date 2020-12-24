class Api::V1::BandsController < ApplicationController
  include Rails.application.routes.url_helpers

    skip_before_action :require_login
    before_action :set_band, only: [:show]


    def index
        bands = Band.all
    
        render json: bands
      end

    def show
        bands = Band.all.page(params[:id].to_i)
        total_pages = Band.all.page(params[:id].to_i).total_pages
        #send total pages back and disable button when page ===
        render json: bands
    end

    def create
        band = Band.new(band_params)
        if params["photo"] == "null"
          #attach a default photo 
          band.photo.attach(io:File.open("app/assets/logo/staged_logo.png"), filename: "staged_logo.png", content_type: "image/png")
        end 
        if band.save
            params[:user_ids].split("").each do |id|
                BandMember.create(user_id: id.to_i, band:band)
            end
            render json: band
        else
            render json: {errors: "Band not created"}
        end
    end

    def update
        band = Band.find(params["id"])
        if params["photo"] == "null"
          band.update(no_photo_params)
        else
          band.update(band_params)
        end 
        if band.save
            # params[:user_ids].split("").each do |id|
            #add or delete band members 
            #     BandMember.create(user_id: id.to_i, band:band)
            # end
            render json: band
        else
            render json: {errors: "Band not created"}
        end
    end

    def band_info
      band_id = params["band_id"]["id"]
      band = Band.find(band_id)
      upcomingEvents = Event.where( band_id: band_id).where("date >= ?", Date.today)
      pastEvents = Event.where( band_id: band_id).where("date < ?", Date.today)
      render json: {band: band, photo: rails_blob_path(band.photo), upcomingEvents: upcomingEvents, pastEvents: pastEvents}
    end
    
    private
    def set_band
    @band = Band.find(params[:id])
    end

    def band_params
    params.permit(:name, :city, :url, :bio, :photo, :users)
    end

    def no_photo_params
    params.permit(:name, :city, :url, :bio, :users)
    end
end
