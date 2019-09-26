class CommentsController < ApplicationController

    def create
        @comment = Comment.create(comment_params)
        redirect_to comment.cryptid
    end

    private

    def comment_params
        params.require(:content).permit(:content, :user_id, :cryptid_id)
    end

end