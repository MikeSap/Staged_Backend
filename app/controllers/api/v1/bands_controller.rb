class Api::V1::BandsController < ApplicationController
    skip_before_action :require_login
    before_action :set_band, only: [:show]


    def index
        bands = Band.all
    
        render json: bands
      end

    def show
        render json: @band
    end

    def create
        byebug
        band = Band.new(band_params)
        if band.save
            # params[:user_ids].each do |id|
            #     byebug
                BandMember.create(user_id: params[:user_ids].to_i, band:band)
            # end
            render json: band
        else
            render json: {errors: "Band not created"}
        end
    end
    
    private
    def set_band
    @band = Band.find(params[:id])
    end

    def band_params
    params.permit(:name, :city, :url, :bio)
    end
end
