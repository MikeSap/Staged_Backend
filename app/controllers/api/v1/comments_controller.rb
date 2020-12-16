class Api::V1::CommentsController < ApplicationController
    skip_before_action :require_login

    def index
        comment = Comment.all
    
        render json: comment
      end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: {errors: "Comment not created"}
        end
    end
    
    private
    def set_comment
        comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:user_id, :event_id, :content)
    end
end
