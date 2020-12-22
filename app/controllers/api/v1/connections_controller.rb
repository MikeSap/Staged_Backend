class Api::V1::ConnectionsController < ApplicationController
    skip_before_action :require_login

    def create
        connection = Connection.new(connection_params)
        if connection.save
          events = Event.where(band_id: connection.followed_id).where("date > ?", Date.today)
            render json: events
        else
            render json: {errors: "Did not follow"}
        end
    end
    
    private

    def connection_params
        params.permit(:follower_id, :followed_id)
    end
end
