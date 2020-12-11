class Api::V1::BandsController < ApplicationController

    def index
        bands = Bands.all
    
        render json: bands
      end

    def show
        render json: band
    end

    def create
        band = Band.new(band_params)
        if band.save
            BandMember.new(user_id: params[:user_id], band:band)
            render json: band
        else
            render json: {errors: "Band not created"}
        end
    end
    
    private
    def set_band
    band = Band.find(params[:id])
    end

    def band_params
    params.require(:band).permit(:name, :city, :url, :bio)
    end
end
