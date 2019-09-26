class CommentsController < ApplicationController

    def create
        @comment = Comment.create(comment_params)
        redirect_to @comment.observation
    end   

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :observation_id)
    end

end