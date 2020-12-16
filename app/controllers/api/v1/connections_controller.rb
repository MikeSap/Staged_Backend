class Api::V1::ConnectionsController < ApplicationController
    skip_before_action :require_login

    def create
        connection = Connection.new(connection_params)
        if connection.save
            render json: connection
        else
            render json: {errors: "Did not follow"}
        end
    end
    
    private

    def connection_params
        params.permit(:follower_id, :followed_id)
    end
end
