class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.times = DateTime.current
        @comment.username = current_user.email
        @comment.save
        redirect_to posts_path(@post)
    end
    private def comment_params
        params.require(:comment).permit(:body)
    end
end
